//: Playground - noun: a place where people can play

import UIKit

enum Suit{
    case spades, hearts, diamons, clubs
    var rank: Int{
        switch self {
        case .spades:
            return 4
        case .hearts:
            return 3
        case .diamons:
            return 2
        case .clubs:
            return 1
        }
    }
    func beats(_ otherSuit: Suit) -> Bool {
        return self.rank > otherSuit.rank
    }
}

var mySuit: Suit = .clubs
var yourSuit: Suit = .diamons
mySuit.beats(yourSuit)
