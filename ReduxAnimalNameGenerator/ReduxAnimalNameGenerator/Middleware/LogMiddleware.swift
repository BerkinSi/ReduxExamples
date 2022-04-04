//
//  LogMiddleware.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation
import Combine
 
func logMiddleware() -> Middleware<AppState, AppAction> {
 
    return { state, action in
        print("Triggered action: \(action)")
        return Empty().eraseToAnyPublisher()
    }
}
