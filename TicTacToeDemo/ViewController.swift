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
    var playerOneMoves = Set<Int>()
    var playerTwoMoves = Set<Int>()
    var playerTurn = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newGame() {
        
        playerOneMoves.removeAll()
        playerTwoMoves.removeAll()
        
        statusLabel.text = "Player 1's turn!"
        
        // Setup tiles
        for index in 1...9 {
            let tile = self.view.viewWithTag(index) as! UIButton
            tile.enabled = true
            tile.setTitle("", forState: .Normal)
        }
    }
    
    func isWinner(player: Int) -> Int {
        
        var winner = 0
        var moveList = Set<Int>()
        // Make sure we're looking at right moves
        if player == 1 {
            moveList = playerOneMoves
        } else {
            moveList = playerTwoMoves
        }
        
        //Check and see if there any winning combinations
        
        for combo in winningCombinations {
            if moveList.contains(combo[0]) && moveList.contains(combo[1]) && moveList.contains(combo[2]) && moveList.count >= 3{
                
                winner = player
                statusLabel.text = "Player \(player) has won the game!"
                for index in 1...9 {
                    let tile = self.view.viewWithTag(index) as! UIButton
                    tile.enabled = false
                }
            }
        }
        
        return winner
    }
    
    func playDefence() -> Int {
        
        var possibleLosses = Array<Array<Int>>()
        var possibleWins = Array<Array<Int>>()
        for combo in winningCombinations {
            var count = 0
            for play in combo {
                
                if playerOneMoves.contains(play) {
                    count++
                }
                
                if playerTwoMoves.contains(play) {
                    count--
                }
                
                if count == 2{
                    
                    possibleLosses.append(combo)
                    count = 0
                }
                
                if count == -2 {
                    
                    possibleWins.append(combo)
                    count = 0
                }
            }
        }
        
    }
    
    // Actions
    
    @IBAction func newGameButtonClicked(sender: AnyObject) {
        
        newGame()
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        if playerTwoMoves.contains(sender.tag) || playerOneMoves.contains(sender.tag) {
            statusLabel.text = "Square already used!"
        } else {
            if playerTurn % 2 != 0 {
                //Add button to player move list
                playerOneMoves.insert(sender.tag)
                sender.setTitle("O", forState: .Normal)
                statusLabel.text = "Player 2's turn!"
                if isWinner(1) == 0 {
                    
                }
            }
        }
    }
    


}

