//
//  EmojiMemoryGame.swift
//  Mesmerize
//
//  Created by Vishal Patel on 2021-06-03.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["😻","😽","😼","🙀","😿","🎃","🤡","👺","💩","👽","🤒","🤘🏻","🤘🏼","👊🏻","✊🏻","👎🏻","👍🏻","🤝","👏🏻","🤞🏻","🤟🏻"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
        emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card:MemoryGame<String>.Card) {
        model.choose(card)
    }
}

