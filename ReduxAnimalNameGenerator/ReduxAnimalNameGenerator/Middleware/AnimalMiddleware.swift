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
        case .animal(action: .fetch):
            return service.generateAnimalInTheFuture()
                .subscribe(on: DispatchQueue.main)
                .map   { AppAction.animal(action: .fetchComplete(animal: $0 )) }
                .catch { (error: AnimalServiceError) -> Just<AppAction> in
                    switch(error) {
                    case .unknown:
                        return Just(AppAction.animal(action: .fetchError(error: .unknown)))
                    case .networkError:
                        return Just(AppAction.animal(action: .fetchError(error: .networkError)))
                    }
                }
                .eraseToAnyPublisher()
        default:
            break
        }
        return Empty().eraseToAnyPublisher()
    }
}
