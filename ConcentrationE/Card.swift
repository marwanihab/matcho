//
//  Card.swift
//  ConcentrationE
//
//  Created by Marwan Ihab on 6/20/18.
//  Copyright © 2018 Marwan Ihab. All rights reserved.
//

import Foundation

struct Card {
    
    var isMatched = false
    var isFaceUp = false
    var seenBefore = false
    var uniqueID: Int=0
    
    static var identifierMaker=0
    
    static func updateIdentifier() -> Int{
        identifierMaker=identifierMaker+1
        return  identifierMaker
    }
    
    init() {
        self.uniqueID = Card.updateIdentifier()
        
    }
    
    
    
}
