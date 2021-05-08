//
//  ContentView.swift
//  Memorize
//
//  Created by Admin on 26/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack() {
        
        HStack(alignment: .bottom) {
            Text("Score: 100")
            Button("Reset Game", action: resetGame)
            
        }
        
        Divider()
        
        Text("Fruit")
            .font(Font.largeTitle)
            .bold()
        
        VStack() {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                           self.viewModel.choose(card: card)
            }
        .padding()
        }
        .padding()
        .foregroundColor(Color.orange)
            }
        }
    }
    
    func resetGame() {
        viewModel.resetGame()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader() { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .aspectRatio(self.aspectRatio, contentMode: .fit)
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let aspectRatio: CGFloat = 0.6
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
