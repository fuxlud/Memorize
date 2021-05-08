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
            
            Text(viewModel.name)
                .font(Font.largeTitle)
                .bold()
            
            VStack() {
                Grid(viewModel.cards) { card in
                    CardView(card: card, colors: self.viewModel.colors).onTapGesture {
                                   self.viewModel.choose(card: card)
                    }
                    .padding()
                    
                }
                .padding()
            }
        }
    }
    
    func resetGame() {
        viewModel.resetGame()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var colors: [Color]
    
    var body: some View {
        GeometryReader() { geometry in
            self.body(for: geometry.size, colors: self.colors)
        }
    }
    
    func body(for size: CGSize, colors: [Color]) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .leading)
                    )
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
