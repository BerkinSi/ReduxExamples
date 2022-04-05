import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let threeDucksReducer: Reducer<ThreeDucksState, ThreeDucksAction>
  = { state, action in
    // get the state to a mutablşe property
    var mutatingState = state
    // define behaviors corresponding different action types
    switch action {
    case .startGame:
      var initialCards = [
        Card(animal: .bat),
        Card(animal: .bat),
        Card(animal: .ducks),
        Card(animal: .ducks),
        Card(animal: .bear),
        Card(animal: .bear),
        Card(animal: .pelican),
        Card(animal: .pelican),
        Card(animal: .horse),
        Card(animal: .horse),
        Card(animal: .elephant),
        Card(animal: .elephant)
      ]
      var popCount = 0
      if mutatingState.difficultyLevel == .normal{
        popCount = 2
      }else if mutatingState.difficultyLevel == .easy{
        popCount = 4
      }
      if popCount != 0{
        for i in 0...popCount - 1{
          initialCards.popLast()
        }
      }
      mutatingState.cards = initialCards.shuffled()
      mutatingState.selectedCards = []
      mutatingState.moves = 0
      mutatingState.gameState = .started
    case .endGame:
      mutatingState.gameState = .title
    case .flipCard(let id):
      // 1
      guard mutatingState.selectedCards.count < 2 else {
        break
      }
      // 2
      guard !mutatingState.selectedCards.contains(where: { $0.id == id }) else {
        break
      }
      // 3
      var cards = mutatingState.cards
      // 4
      guard let selectedIndex = cards.firstIndex(where: { $0.id == id }) else {
        break
      }
      // 5
      let selectedCard = cards[selectedIndex]
      let flippedCard = Card(
        id: selectedCard.id,
        animal: selectedCard.animal,
        isFlipped: true)
      // 6
      cards[selectedIndex] = flippedCard

      // 7
      mutatingState.selectedCards.append(selectedCard)
      mutatingState.cards = cards
       // 8
      mutatingState.moves += 1
      
      // 1
      case .unFlipSelectedCards:
        let selectedIDs = mutatingState.selectedCards.map { $0.id }
        
        // 2
        let cards: [Card] = mutatingState.cards.map { card in
          guard selectedIDs.contains(card.id) else {
            return card
          }
          return Card(id: card.id, animal: card.animal, isFlipped: false)
        }

        mutatingState.selectedCards = []
        mutatingState.cards = cards

      // 3
      case .clearSelectedCards:
        mutatingState.selectedCards = []
    case .winGame:
      mutatingState.gameState = .won
    case .setDifficulty(let level):
      mutatingState.difficultyLevel = level
    }
    // 4
    return mutatingState

}
