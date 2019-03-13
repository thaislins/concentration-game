//
//  Card.swift
//  Concentration
//
//  Created by Thais Lins on 2019-03-07.
//  Copyright © 2019 Thais Lins. All rights reserved.
//

import Foundation

struct Card {
    
    var id : Int
    var isFaceUp = false
    var isMatched = false
    
    static var identifierFactory = 0
    
    static func getUniqueId() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
}
