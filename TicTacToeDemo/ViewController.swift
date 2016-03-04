//
//  ViewController.swift
//  TicTacToeDemo
//
//  Created by User on 3/4/16.
//  Copyright © 2016 Elijah Buters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    // Properties
    
    let winningCombinations = [[1, 2, 3,], [4, 5, 6], [7, 8, 9],[1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    let playerOneMoves = Set<Int>()
    let playerTwoMoves = Set<Int>()
    var playerTurn = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions
    
    @IBAction func newGameButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
    }
    


}

