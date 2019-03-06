//
//  ViewController.swift
//  Concentration
//
//  Created by Thais Lins on 2018-12-20.
//  Copyright © 2018 Thais Lins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    var flipCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        flipCountLabel.text = "Flips: " + String(flipCount)
        flipCard(withEmoji: sender.currentTitle, on: sender)
    }
    
    func flipCard(withEmoji emoji: String?, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))" )
        if button.currentTitle != "" {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

