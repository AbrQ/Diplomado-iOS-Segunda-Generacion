//
//  SignModel.swift
//  BasicProyect
//
//  Created by Abraham Quezada on 15/08/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation
import GameplayKit

//Enum which reports the kind of sign

enum SignModel{
    case rock
    case scissors
    case paper
    
    //var emoticon returns the emoticon type
    var emoticon: String{
        switch self {
        case .rock:
            return "👊🏻"
        case .scissors:
            return "✌🏻"
        case .paper:
            return "🖐🏻"
        }
    }
    
    //This function provide the machine's turn
    func hisTurn(_ machine: SignModel) -> GameModel{
        switch self {
            
        case .rock:
            switch machine{
            case .rock:
                return GameModel.draw
            case .scissors:
                return GameModel.win
            case .paper:
                return GameModel.lose
            }
            
        case .scissors:
            switch machine{
            case .rock:
                return GameModel.lose
            case .scissors:
                return GameModel.draw
            case .paper:
                return GameModel.win
            }
            
        case .paper:
            switch machine{
            case .rock:
                return GameModel.win
            case .scissors:
                return GameModel.lose
            case .paper:
                return GameModel.draw
            }
        }
    }

}

//This function is provide by GameplayKit and give us a random value
let random = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomChoice() -> SignModel{
    let sign = random.nextInt()
    
    if sign == 0{
        return .rock
    }
    else if  sign == 1{
       return .scissors
    }
    else{
        return .paper
    }
}

