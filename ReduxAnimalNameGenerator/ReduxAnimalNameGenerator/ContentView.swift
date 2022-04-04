//
//  ContentView.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import SwiftUI

struct ContentView: View {
    let store = AppStore(initialState: .init(),
                         reducer: appReducer)
 
    init() {
            store.dispatch(.getAnimal)
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
