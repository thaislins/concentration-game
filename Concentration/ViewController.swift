//
//  ViewController.swift
//  Concentration
//
//  Created by Thais Lins on 2018-12-20.
//  Copyright © 2018 Thais Lins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairs: (cards.count + 1) / 2)
    @IBOutlet var cards: Array<UIButton>!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiChoices = ["👻", "🧛🏼‍♀️", "🎃", "🦇", "🍭", "🍎"]
    var gameOver = false
    var emoji = [Int: String]()
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.layer.cornerRadius = 5.0
        restartButton.isHidden = true
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cards.index(of: sender), sender.backgroundColor != #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) {
            flipCount += 1
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            if gameOver { finishGame() }
        }
    }
    
    func updateViewFromModel() {
        var matchedCardCount = 0
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            matchedCardCount += card.isMatched ? 1 : 0
            gameOver = matchedCardCount == cards.count ? true : false
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func finishGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            for card in self.cards {
                card.setTitle("", for: UIControl.State.normal)
                card.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0)
            }
            self.restartButton.isHidden = false
        })
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiChoices.count > 0 {
            let index = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.id] = emojiChoices.remove(at: index)
        }
        
        return emoji[card.id] ?? "?"
    }
}
