//
//  Card.swift
//  Concentration
//
//  Created by Priit Pärl on 09/03/2018.
//  Copyright © 2018 Priit Pärl. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
