//
//  Card.swift
//  Concentration
//
//  Created by Priit Pärl on 09/03/2018.
//  Copyright © 2018 Priit Pärl. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
