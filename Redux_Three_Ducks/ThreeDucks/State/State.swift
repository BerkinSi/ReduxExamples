import Foundation

struct ThreeDucksState {
  var gameState: GameState = .title
  var cards: [Card] = []
  var selectedCards: [Card] = []
  var moves: Int = 0
  var difficultyLevel: DifficultyLevel = .easy
}
