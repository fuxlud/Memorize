//
//  Cardify.swift
//  Memorize
//
//  Created by Admin on 09/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    var colors: [Color]
    var size: CGSize
    
    func body(content:Content) -> some View {
        ZStack {
            if isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(gradient(with: colors),
                                lineWidth:edgeLineWidth)
                    content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                .fill(gradient(with: colors))
                
            }
        }
        .aspectRatio(self.aspectRatio, contentMode: .fit)
        .font(Font.system(size: fontSize(for: size)))
    }
    
    func gradient(with colors: [Color]) -> LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .leading)
    }
    // MARK: Drawing Constants
   let aspectRatio: CGFloat = 0.6
   let fontScaleFactor: CGFloat = 0.6
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}
