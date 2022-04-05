import Foundation
import Combine


typealias ThreeDucksStore = Store<ThreeDucksState, ThreeDucksAction>

class Store<State, Action>: ObservableObject {

  @Published private(set) var state: State
  private let reducer: Reducer<State, Action>
  private let middlewares: [Middleware<State, Action>]
  
  private var subscriptions: Set<AnyCancellable> = []


  private let queue = DispatchQueue(
    label: "com.raywenderlich.ThreeDucks.store",
    qos: .userInitiated)  

  init(
    initial: State,
    reducer: @escaping Reducer<State, Action>,
    middlewares: [Middleware<State, Action>] = []
  ) {
    self.state = initial
    self.reducer = reducer
    self.middlewares = middlewares
  }

  
  func dispatch(_ action: Action) {
    queue.sync {
      self.dispatch(self.state, action)
    }
  }
  
  private func dispatch(_ currentState: State, _ action: Action) {
    let newState = reducer(currentState, action)
    
    // 1
    middlewares.forEach { middleware in
      // 2
      let publisher = middleware(newState, action)
      publisher
        // 3
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: dispatch)
        .store(in: &subscriptions)
    }

    
    state = newState
  }

  
}
