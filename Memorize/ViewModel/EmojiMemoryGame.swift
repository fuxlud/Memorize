//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Admin on 27/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🎷", "🥁", "🪕", "🎻", "🎺"]
        let range = 2..<emojis.count
        let numberOfPairsOfCards = Int.random(in: range)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            return emojis[pairIndex]
        }
    }
      
    static func cardFont(numberOfCards: Int) -> Font {
        let largeNumberOfCards = 7
        return numberOfCards < largeNumberOfCards ? Font.largeTitle : Font.body
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
