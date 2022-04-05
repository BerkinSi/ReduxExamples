import Foundation

enum ThreeDucksAction {
  case startGame
  case endGame
  case flipCard(UUID)
  case clearSelectedCards
  case unFlipSelectedCards
  case winGame
  case setDifficulty(DifficultyLevel)
}
