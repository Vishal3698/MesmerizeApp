//
//  MemoryGame.swift
//  Mesmerize
//
//  Created by Vishal Patel on 2021-06-03.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
//cards.firstIndex(where: { aCardinTheArray in aCardinTheArray.id == card.id}) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentioalMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentioalMatchIndex].content == cards[chosenIndex].content{
                    cards[potentioalMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }

//if let chosenIndex = index(of: card){
    
//    func index(of card: Card) ->Int? {
//        for index in 0..<cards.count{
//            if cards[index].id == card.id{
//                return index
//            }
//        }
//        return nil
//    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairindex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairindex)
            cards.append(Card(content: content, id: pairindex*2))
            cards.append(Card(content: content, id: pairindex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
//        CardContent is a generic data type that can be anything and user will decide it. Ex. String vs Image
        var id: Int
    }
}


