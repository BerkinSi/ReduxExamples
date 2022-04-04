//
//  AnimalService.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation
import Combine

struct AnimalService {
    
    func generateAnimalInTheFuture() -> AnyPublisher<String,Never> {
        let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
        let number = Double.random(in: 0..<5)
        
        return Future<String, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + number) {
                let result = animals.randomElement() ?? ""
                promise(.success(result))
            }
        }
        .eraseToAnyPublisher()
    }
}
