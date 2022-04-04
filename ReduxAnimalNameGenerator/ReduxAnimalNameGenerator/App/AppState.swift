//
//  AppState.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation

import Foundation
 
struct AppState {
    var animal: AnimalState
}
 
struct AnimalState {
    var current: String = ""
    var fetchError: String?
    var fetchInProgress: Bool = false
}
