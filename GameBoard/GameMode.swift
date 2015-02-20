//
//  GameModel.swift
//  GameBoard
//
//  Created by William McDuff on 2015-02-19.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

private let _mainData = DataModel()

class DataModel: NSObject {
    
    var allGames: [GameModel] = []
    
    var currentGame: GameModel?
    
    class func mainData() -> DataModel { return _mainData }
    
}

class GameModel: NSObject {
    
    var boardSquares = [
        
        [0, 1, 0, 1, 0, 1, 0, 1],
        [1, 0, 1, 0, 1, 0, 1, 0],
        [0, 1, 0, 1, 0, 1, 0, 1],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [2, 0, 2, 0, 2, 0, 2, 0],
        [0, 2, 0, 2, 0, 2, 0, 2],
        [2, 0, 2, 0, 2, 0, 2, 0]
        
    ]
    
    
    var boardPieces: [[GamePiece?]] = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: nil))
    var availableMoves: [(Int,Int)] = []
    
    var players: [Player] = [Player(direction: 1),Player(direction: -1)]
    
    
    // winner
    
    var winner: Player?
    var isDraw = false
    
    // moves made
    
    
    
    // kings per player
    
}

// var oppositeRow = player.direction == 1 ? 7 : 0

class Player: NSObject {
    
    var direction: Int!
    init(direction: Int) {
        super.init()
        self.direction = direction
    }
    
    
}

