//
//  AnimalService.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation
import Combine

enum AnimalServiceError: Error, CaseIterable {
    case unknown
    case networkError
}

struct AnimalService {
    
    func generateAnimalInTheFuture() -> AnyPublisher<String,AnimalServiceError> {
        let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
        let number = Double.random(in: 0..<5)
        
        return Future<String, AnimalServiceError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + number) {
                let randomError = Int.random(in: 0..<2)
                if(randomError != 0) {
                    promise(.success( animals.randomElement() ?? ""))
                }
                promise(.failure(AnimalServiceError.allCases.randomElement()!))
            }
        }
        .eraseToAnyPublisher()
    }
}
