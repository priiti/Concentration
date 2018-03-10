//
//  ViewController.swift
//  Concentration
//
//  Created by Priit Pärl on 09/03/2018.
//  Copyright © 2018 Priit Pärl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    private(set) var flipCount: Int = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            handleButtonState(by: button, by: card)
        }
    }
    
    func handleButtonState(by button: UIButton, by card: Card) {
        if card.isFaceUp {
            button.setTitle(emoji(for: card), for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            button.setTitle("", for: UIControlState.normal)
            if card.isMatched {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                button.isEnabled = false
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices: Array<String> = ["🎃", "👻", "🦇", "😈", "🍎", "😱", "🙀", "🍭", "🍬"]
    
    private var emoji: Dictionary<Int, String> = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    private func updateFlipCountLabel() {
        flipCountLabel.text = "Flips: \(flipCount)"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
        
    }
}
