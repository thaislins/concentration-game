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
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
}
