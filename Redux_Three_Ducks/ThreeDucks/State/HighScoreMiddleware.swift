//import Combine
//import Foundation
//
//let highScore: Middleware<ThreeDucksState, ThreeDucksAction> =
//{ state, action in
//  
//  switch action {
//  // 1
//  case .flipCard:
//    // 1
//    let flippedCards = state.cards.filter { $0.isFlipped }
//    // 2
//    if flippedCards.count == state.cards.count {
//      // 3
//      return Just(.winGame)
//        .delay(for: 1, scheduler: DispatchQueue.main)
//        .eraseToAnyPublisher()
//    }
//
//    
//    let selectedCards = state.selectedCards
//    // 2
//    if selectedCards.count == 2 {
//      if selectedCards[0].animal == selectedCards[1].animal {
//        // 3
//        return Just(.clearSelectedCards)
//          .eraseToAnyPublisher()
//      } else {
//        // 4
//        return Just(.unFlipSelectedCards)
//          .delay(for: 1, scheduler: DispatchQueue.main)
//          .eraseToAnyPublisher()
//      }
//    }
//
//  default:
//    break
//  }
//
//  
//  return Empty().eraseToAnyPublisher()
//}
