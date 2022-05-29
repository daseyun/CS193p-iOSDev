//
//  MemoryGame.swift
//  Memorize
//
//  Created by Daniel Yun on 5/29/22.
//

import Foundation // basic ds. arrays etc. no ui

// MODEL
struct MemoryGame<CardContent> {
    // readonly 
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x2 cards to cards Array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
        
    }
    
    // design choice to nest it under MemoryGame
    // shows this MemoryGame.Card is only meant for MemoryGame
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // putting this as text/image limits future work. use generic
        
    }  
}
