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
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90))
                .fill(gradient(with: colors))
                .opacity(0.4)
                .padding(5)
            Text(card.content)
        }
        .modifier(Cardify(isFaceUp: card.isFaceUp, colors: colors, size: size))
//        .cardify(isFaceUp: card.isFaceUp)
    }
    
    func gradient(with colors: [Color]) -> LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .leading)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
