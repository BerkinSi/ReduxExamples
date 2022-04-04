//
//  AnimalView.swift
//  ReduxAnimalNameGenerator
//
//  Created by Berkin Sili on 4.04.2022.
//

import Foundation
import SwiftUI

struct AnimalView: View {
    @EnvironmentObject var store: AppStore
    
    func loadAnimal() {
        store.dispatch(.animal(action: .fetchAnimal))
    }
    
    var body: some View{
        VStack {
            Text(store.state.animal.currentAnimal).font(.system(.largeTitle)).padding()
            Button("Tap me", action: { self.loadAnimal() })
        }
    }
}
