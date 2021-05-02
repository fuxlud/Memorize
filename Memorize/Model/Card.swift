import Foundation

struct Card<CardContent>: Identifiable  where CardContent: Equatable  {
    var id: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: CardContent
}
