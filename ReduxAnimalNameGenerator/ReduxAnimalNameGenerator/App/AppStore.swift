//
//  AppStore.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

///Some Notes on middleware
///In Redux, a Middleware is an entity (function) that is executed when certain Actions go through the Store. It receives a copy of the current AppState, performs some operations (API calls, or async tasks), and dispatches a new Action.
///
///Middlewares take care of all the heavy load in the background (like API call, database fetches and updates, etc…) while Reducers simple deal with updating our state synchronously. Let’s update the store to support Middlewares.

import Foundation
import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?
typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
    // Read-only access to app state
    @Published private(set) var state: State
    
    var tasks = [AnyCancellable]()
    
    let serialQueue = DispatchQueue(label: "redux.serial.queue")
    
    private let reducer: Reducer<State, Action>
    let middlewares: [Middleware<State, Action>]
    private var middlewareCancellables: Set<AnyCancellable> = []
    
    init(initialState: State,
         reducer: @escaping Reducer<State, Action>,
         middlewares: [Middleware<State, Action>] = []) {
        
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    // The dispatch function.
    func dispatch(_ action: Action) {
        reducer(&state, action)
        
        for mw in middlewares {
            guard let middleware = mw (state, action) else {break}
            
            middleware
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &middlewareCancellables)
        }
    }
}
