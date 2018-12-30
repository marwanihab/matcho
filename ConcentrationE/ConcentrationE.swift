//
//  ConcentrationE.swift
//  ConcentrationE
//
//  Created by Marwan Ihab on 6/20/18.
//  Copyright © 2018 Marwan Ihab. All rights reserved.
//

import Foundation
class ConcentrationE{
    
    
    var arrayOfCards = Array<Card>()
    var score=0
    var indexOfShowenCard:Int?
    
    
    func chooseCard(for index:Int) {
        
        if !arrayOfCards[index].isMatched{
        if  indexOfShowenCard != nil {
            let matchIndex = indexOfShowenCard!
            if matchIndex != index{
            arrayOfCards[index].isFaceUp = true
            //arrayOfCards[index].seenBefore+=1
                
            indexOfShowenCard = nil
                
            if arrayOfCards[index].uniqueID == arrayOfCards[matchIndex].uniqueID {
                arrayOfCards[index].isMatched=true
                arrayOfCards[matchIndex].isMatched=true
                self.score=score+2
            }
            else{
                if  arrayOfCards[index].seenBefore == true{
                    self.score=score-1
                    
                }
                if  arrayOfCards[matchIndex].seenBefore == true{
                    self.score=score-1
                    
                }
                arrayOfCards[index].seenBefore=true
                arrayOfCards[matchIndex].seenBefore=true
                
                }
            }
            
            
        }
        else{
            for flipDownIndex in arrayOfCards.indices{
                arrayOfCards[flipDownIndex].isFaceUp=false
            }
            
            
            indexOfShowenCard = index
            arrayOfCards[index].isFaceUp = true
            
            }
        }
        
        
    }
    
    init(numberOfpairsOfCards:Int){
        for _ in 0..<numberOfpairsOfCards {
            let cardCreated = Card()
            self.arrayOfCards.append(cardCreated)
            self.arrayOfCards.append(cardCreated)
        }
        for index in arrayOfCards.indices{
            print(arrayOfCards[index].uniqueID)
        }
           print("------------")
            self.arrayOfCards.shuffle()
        for index in arrayOfCards.indices{
            print(arrayOfCards[index].uniqueID)
        }
       
      
    }
    
    
    
//    func shuffleCards(With Cards:Array<Card>){
//
//        var CardsToBeRemovedFrom = Cards
//        var shuffled = [Card]();
//
//        for _ in 0..<CardsToBeRemovedFrom.count
//        {
//            let rand = Int(arc4random_uniform(UInt32(CardsToBeRemovedFrom.count)))
//
//            shuffled.append(Cards[rand])
//
//            CardsToBeRemovedFrom.remove(at: rand)
//        }
//
//        self.arrayOfCards=shuffled
//
//        for index in shuffled.indices{
//            print(shuffled[index].uniqueID)
//        }
//        }
//
//
    }

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
    

