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
                Text("Score: \(self.viewModel.score)")
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
                front()
                Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(10))
                    .fill(gradient(with: colors))
                    .opacity(0.4)
                    .padding(5)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(gradient(with: colors))
                }
            }
        }
        .aspectRatio(self.aspectRatio, contentMode: .fit)
        .font(Font.system(size: fontSize(for: size)))
    }
    
    @ViewBuilder
    func front() -> some View {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(gradient(with: colors),
                    lineWidth:edgeLineWidth)
    }
    
    func gradient(with colors: [Color]) -> LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .leading)
    }
    
    // MARK: Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let aspectRatio: CGFloat = 0.6
    let fontScaleFactor: CGFloat = 0.6
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
