//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Isaac Granillo on 11/30/15.
//  Copyright © 2015 Isaac Granillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1  // 1 = Os, 2 = Xs
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameActive = true
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var button: UIButton!
    
    
    @IBOutlet var playAgainButton: UIButton!
    
    
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x, gameOverLabel.center.y - 500)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x, playAgainButton.center.y - 500)
        
        var buttonToClear : UIButton
        
        for (var i = 0; i <= 8; i++) {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
            
                sender.setImage(UIImage(named: "o.png"), forState: .Normal)
        
                activePlayer = 2
                
            }
            
            else {
                sender.setImage(UIImage(named: "x.png"), forState: .Normal)
            
                activePlayer = 1
            }
            
            for combination in winningCombinations { //checking to see if there are 3 of the same in a row
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "O's Win!"
                    }
                    
                    else {
                        gameOverLabel.text = "X's Win!"
                    }
                    
                    endGame()
                    
                }
            }
            
            if gameActive == true {
            
                gameActive = false

                for buttonState in gameState {
                
                    if buttonState == 0 {
                    
                        gameActive = true
                    }
                
                }
            
                if gameActive == false {
                
                    gameOverLabel.text = "Draw!"
                
                    endGame()
                }
            
            }
        
        }
    }
    
    func endGame() {
    
        gameOverLabel.hidden = false
    
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x, self.gameOverLabel.center.y + 500)
        })
    
        playAgainButton.hidden = false
    
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x, self.playAgainButton.center.y + 500)
        })
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x, gameOverLabel.center.y - 500)
        
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x, playAgainButton.center.y - 500)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

