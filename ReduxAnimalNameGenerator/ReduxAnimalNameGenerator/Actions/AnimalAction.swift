//
//  AnimalAction.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation

enum AnimalAction {
    case fetch
    case fetchComplete(animal: String)
    case fetchError(error: AnimalServiceError?)
}
