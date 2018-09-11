//
//  ViewController.swift
//  BasicProyect
//
//  Created by Abraham Quezada on 15/08/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconMachineLabel: UILabel!
    @IBOutlet weak var machineMessageLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var gameStatus: GameModel = GameModel.start
    

    override func viewDidLoad() {
        super.viewDidLoad()
        aNewGameAgain()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //This function provides a new game conditions
    
    func aNewGameAgain(){
        iconMachineLabel.text = "💩"
        machineMessageLabel.text = "Rock,Scissors,Paper!"
        rockButton.isEnabled = true
        rockButton.isHidden = false
        scissorsButton.isEnabled = true
        scissorsButton.isHidden = false
        paperButton.isEnabled = true
        paperButton.isHidden = false
    }
    
    func turn(_ player: SignModel){
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        
        let opponentsTurn = randomChoice()
        iconMachineLabel.text = opponentsTurn.emoticon
        gameStatus = player.hisTurn(opponentsTurn)
        
        switch gameStatus {
            
        case .win:
            view.backgroundColor = .yellow
            machineMessageLabel.text = "Great, You Win!"
            machineMessageLabel.textColor = .black
            playAgainButton.tintColor = .blue
        case .lose:
            view.backgroundColor = .purple
            machineMessageLabel.text = "Ups, You Lose :("
            machineMessageLabel.textColor = .white
            playAgainButton.tintColor = .green
        case .draw:
            view.backgroundColor = .red
            machineMessageLabel.text = "It's a draw"
            playAgainButton.tintColor = .white
        case .start:
            machineMessageLabel.text = "Rock,Scissors,Paper!"
        }
        
        switch player {
            
        case .rock:
            rockButton.isHidden = false
            scissorsButton.isHidden = true
            paperButton.isHidden = true
            
        case .scissors:
            rockButton.isHidden = true
            scissorsButton.isHidden = false
            paperButton.isHidden = true
            
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
            paperButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
    
    
    
    @IBAction func rockButtonTapped(_ sender: Any) {
        turn(SignModel.rock)
    }
    
    @IBAction func scissorsButtonTapped(_ sender: Any) {
        turn(SignModel.scissors)
    }
    
    @IBAction func paperButtonTapped(_ sender: Any) {
        turn(SignModel.paper)
    }
    
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        aNewGameAgain()
    }

}

