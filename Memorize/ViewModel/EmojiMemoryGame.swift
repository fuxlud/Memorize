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
        let theme = ThemeFactory.shared.randomTheme()
        var numberOfCards = theme.numberOfCards
        if theme.numberOfCards == nil {
            let range = 2..<theme.emojis.count
            numberOfCards = Int.random(in: range)
        }
        return MemoryGame<String>(name: theme.name, colors: theme.colors, numberOfPairsOfCards: numberOfCards!) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
      
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    static func cardFont(numberOfCards: Int) -> Font {
        let largeNumberOfCards = 7
        return numberOfCards < largeNumberOfCards ? Font.largeTitle : Font.body
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var name: String {
        model.name
    }
    
    var colors: [Color] {
        model.colors
    }
    
    var score: Int {
        model.score
    }
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
