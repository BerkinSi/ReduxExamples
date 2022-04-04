//
//  AnimalReducer.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation

func animalReducer(state: inout AnimalState, action: AnimalAction) -> Void {
   switch(action) {
       case .fetchAnimal:
            state.currentAnimal = "Loading..."
       case .setCurrentAnimal(let animal):
            state.currentAnimal = animal
   }
}
