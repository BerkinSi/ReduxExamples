//
//  Reducer.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(state: inout AppState, action: AppAction) -> Void {
    switch action {
    case .getAnimal:
        state.currentAnimal = ["Cat",
                               "Dog",
                               "Crow",
                               "Horse",
                               "Iguana",
                               "Cow",
                               "Racoon"]
            .randomElement() ?? ""
    }
}
