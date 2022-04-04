//
//  AnimalMiddleware.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation
import Combine

func animalMiddlware(service: AnimalService) -> Middleware<AppState, AppAction> {
    return { state, action in
        switch action {
        case .animal(action: .fetchAnimal):
            return service.generateAnimalInTheFuture()
                .subscribe(on: DispatchQueue.main)
                .map { AppAction.animal(action: .setCurrentAnimal(animal: $0 )) }
                .eraseToAnyPublisher()
        default:
            break
        }
        return Empty().eraseToAnyPublisher()
    }
}
