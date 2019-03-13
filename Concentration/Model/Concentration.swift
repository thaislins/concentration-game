//
//  Concentration.swift
//  Concentration
//
//  Created by Thais Lins on 2019-03-07.
//  Copyright © 2019 Thais Lins. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = Array<Card>()
    var indexOfOnlyFaceUpCard: Int?
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func startGame() {
        indexOfOnlyFaceUpCard = nil
        cards.shuffle()
        resetCards()
    }
    
    func resetCards() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            // checks if cards match
            if let matchIndex = indexOfOnlyFaceUpCard, matchIndex != index {
                if cards[index].id == cards[matchIndex].id {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = nil
            } else {
                // no cards or 2 cards are facing up
                for cardsIndex in cards.indices {
                    cards[cardsIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = index
            }
        }
    }
}
