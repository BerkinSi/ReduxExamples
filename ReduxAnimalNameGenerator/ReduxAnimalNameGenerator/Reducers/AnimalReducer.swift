//
//  AnimalReducer.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation

func animalReducer(state: inout AnimalState, action: AnimalAction) -> Void {
   switch(action) {
   case .fetch:
       state.fetchError = nil
       state.fetchInProgress = true

   case .fetchComplete(let animal):
       state.fetchError = nil
       state.fetchInProgress = false
       state.current = animal

   case .fetchError(let error):
       state.fetchInProgress = false
       switch error {
       case .networkError:
           state.fetchError = "I'm sorry, but the server went away"
       default:
           state.fetchError = "Oops!.  It seems someone made a mistake!"
       }
   }
}
