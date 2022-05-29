//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Daniel Yun on 5/29/22.
//

// VIEWMODEL
import SwiftUI

func makeCardContent(index: Int) -> String {
    return "😀"
}

class EmojiMemoryGame {
    // static lets us reference 'emojis' within EmojiMemoryGame (line 22)
    static let emojis = ["🚗", "🚛", "🚜", "🚓", "🚕", "🚙", "🚌", "🚎"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
            })
    }
    // private(set) readonly access.
    private var model: MemoryGame<String> = createMemoryGame() // can init with this since func is static 
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
