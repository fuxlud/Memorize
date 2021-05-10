//
//  MemoryGame.swift
//  Memorize
//
//  Created by Admin on 27/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation
import SwiftUI

struct MemoryGame <CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var name: String
    var colors: [Color]
    var indexOfTheFaceUpCard: Int?
    var score: Int = 0
    
    mutating func choose(card: Card) {
        guard let chosenIndex: Int = cards.firstIndex(matching: card) else {
            return
        }
        
        if !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if indexOfTheFaceUpCard != nil {
                if cards[chosenIndex].content == cards[indexOfTheFaceUpCard!].content {
                    cards[chosenIndex].isMatched = true
                    cards[indexOfTheFaceUpCard!].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].isSeen {
                        score -= 1
                    }
                }
                indexOfTheFaceUpCard = nil
            } else {
                for index in cards.indices {
                    if !cards[index].isMatched {
                        cards[index].isFaceUp = false
                    }
                }
                indexOfTheFaceUpCard = chosenIndex
            }
            
            self.cards[chosenIndex].isFaceUp = true
            self.cards[chosenIndex].isSeen = true
        }
    }
    
    init(name: String, colors: [Color], numberOfPairsOfCards: Int, cardContentFactory:(Int) -> CardContent) {
        
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2 + 1, content: content))
        }
        cards.shuffle()
        
        self.name = name
        self.colors = colors
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeen: Bool = false
        var content: CardContent
    }
}
