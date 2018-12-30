//
//  ViewController.swift
//  ConcentrationE
//
//  Created by Marwan Ihab on 6/20/18.
//  Copyright © 2018 Marwan Ihab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationE(numberOfpairsOfCards: ((CardsButtons.count+1)/2))
    
    var randomThemeIndex=0
    
    var choosenTheme=[String]()
    //var choosenTheme = ["🍏", "🥑", "🍇", "🍒", "🍑", "🥝", "🍐", "🍎", "🍉", "🍌"]
    
    var Themes: Array<Array<String>> = [
        
        ["👩", "👮🏻‍♂️", "👩‍💻", "👨🏾‍🌾", "🧟‍♀️", "👩🏽‍🎨", "👩🏼‍🍳", "🧕🏼", "💆‍♂️", "🤷🏽‍♂️"],
        ["🐶", "🙊", "🐧", "🦁", "🐆", "🐄", "🐿", "🐠", "🦆", "🦉"],
        ["😀", "🤪", "😬", "😭", "😎", "😍", "🤠", "😇", "🤩", "🤢"],
        ["🍏", "🥑", "🍇", "🍒", "🍑", "🥝", "🍐", "🍎", "🍉", "🍌"],
        ["🚗", "🚓", "🚚", "🏍", "✈️", "🚜", "🚎", "🚲", "🚂", "🛴"],
        ["🏊🏽‍♀️", "🤽🏻‍♀️", "🤾🏾‍♂️", "⛹🏼‍♂️", "🏄🏻‍♀️", "🚴🏻‍♀️", "🚣🏿‍♀️", "⛷", "🏋🏿‍♀️", "🤸🏼‍♂️"],
                      
    ]
    
    
    @IBOutlet var CardsButtons: [UIButton]!
    
    @IBOutlet weak var score: UILabel!
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game = ConcentrationE(numberOfpairsOfCards: ((CardsButtons.count+1)/2))
        
        for eachButton in CardsButtons {
            eachButton.backgroundColor=#colorLiteral(red: 1, green: 0.7716563031, blue: 0.08057792465, alpha: 1)
        }
        
        self.chooseTheme()
        self.updateViewFromModel()
        
    }
    @IBAction func touchCard(_ sender: UIButton) {
        
        
        
        let buttonindex = CardsButtons.index(of: sender)!
        
        self.game.chooseCard(for: buttonindex)
        
        self.updateViewFromModel()
        
        
    }
    
//    func flipCard(with Card:UIButton){
//        if Card.currentTitle == "?"{
//            Card.backgroundColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            Card.setTitle("", for: UIControlState.normal)
//        }
//        else{
//            Card.backgroundColor=#colorLiteral(red: 1, green: 0.7716563031, blue: 0.08057792465, alpha: 1)
//             Card.setTitle("?", for: UIControlState.normal)
//        }
//    }
    
    func chooseTheme() {
        let random = Int(arc4random_uniform(UInt32(Themes.count)))
        for index in 0..<Themes.count{
            if index == random {
               choosenTheme=Themes[index]
               //print(choosenTheme)
            }
        }
        
    }
    
    func updateViewFromModel(){
        
        self.score.text=String(game.score)
        
        
        
        for index in CardsButtons.indices{
            let button = CardsButtons[index]
            let card = game.arrayOfCards[index]
            
            
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
            }
            else{
                
                button.setTitle("", for: UIControlState.normal);
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.4405905843, green: 0.4793855551, blue: 1, alpha: 0):#colorLiteral(red: 1, green: 0.7716563031, blue: 0.08057792465, alpha: 1);
               
            }
            // print("in")
            //print(button.currentTitle!)
            
        }
    }
    
    var emojisUsed = Dictionary<Int,String>()
    
    func emoji(for id: Card) -> String{
        
        if emojisUsed[id.uniqueID] == nil{
            if choosenTheme.count>0{
            let randomIndexOfemojiUsed = Int(arc4random_uniform(UInt32(choosenTheme.count)))
            emojisUsed[id.uniqueID] = choosenTheme.remove(at: randomIndexOfemojiUsed)
                //print(emojisUsed[id.uniqueID])
            }
            
        }
        //print(choosenTheme)
        
       return emojisUsed[id.uniqueID] ?? ""
        
        
        
        
    }
    
    
    
    
}

