//
//  MemoryGame.swift
//  Memorize
//
//  Created by Admin on 27/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

struct MemoryGame <CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        guard let chosenIndex: Int = cards.firstIndex(matching: card) else {
            return
        }
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory:(Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
