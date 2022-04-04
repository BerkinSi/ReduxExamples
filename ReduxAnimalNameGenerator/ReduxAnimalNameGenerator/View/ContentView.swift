//
//  ContentView.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import SwiftUI

struct ContentView: View {
    let store = AppStore(initialState: .init(animal: AnimalState()),
                         reducer: appReducer, middlewares: [animalMiddlware(service: AnimalService()),
                                                            logMiddleware()])
 
    init() {
        store.dispatch(.animal(action: .fetchAnimal))
    }
    var body: some View {
        AnimalView()
            .environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
