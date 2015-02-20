//
//  Board.swift
//  GameBoard
//
//  Created by William McDuff on 2015-02-18.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//


/*
import Foundation
import UIKit

class Board: BoardViewDelegate {
    
    var boardView: GameBoardView?
    
    var tileSelected: Bool?
    
    var previouslySelectedPiece: GamePiece?
    var currentPlayer : PlayerType?
    init() {
      
        
        tileSelected = false
        
          currentPlayer = PlayerType.Player1
        
        returnPlayerTypeForTile(0, col: 0)
        
        if let board = boardView {
            board.delegate = self
        }
        
        
    }
    
    func returnPlayerTypeForTile(row: Int, col: Int) -> PlayerType? {
        
        
        var value = boardSquares[row][col]
        
        var playerType = PlayerType(rawValue:value)
        
        
       
        return playerType
        
    }
    
    func returnGamePieceTypeForTile(row: Int, col: Int) -> GamePiece? {
        
        
    
        var piece = boardPieces[row][col]
        
        return piece
        
    }
    
    func placeTouched(board: GameBoardView, _ location: BoardLocation) {
        
        
      
        var selectedPiece = returnGamePieceTypeForTile(location.x, col: location.y)
        
        
        

            
            
            
        if currentPlayer == selectedPiece!.type {
            
            
            
            self.colorMoveChoices(selectedPiece!, color: UIColor.redColor())
           
            
            if tileSelected == false {
                selectedPiece!.changeColor(UIColor.redColor())
                
                previouslySelectedPiece = selectedPiece
                
                tileSelected = true
                
            }
                
            else {
                selectedPiece!.changeColorToOriginalColor()
                
                previouslySelectedPiece = nil
                
                tileSelected = false
            }
            
        }
        
        else {
            
            
            if previouslySelectedPiece != nil {
                var validMoves = self.getValidMoveOptions(previouslySelectedPiece!)
                
                println(validMoves)
                for move in validMoves {
                    
                    println("there is a validMove")
                    
                    
                    //   println("Move.col: \(move.col), Move.row: \(move.row)")
                    
                    //  println("Piece.col: \(selectedPiece!.col), Piece.row: \(selectedPiece!.row)")
                    if move.col == selectedPiece!.col && move.row == selectedPiece!.row {
                        
                        println("right row and col")
                        
                        
                       previouslySelectedPiece?.removeFromSuperview()
                        
                        var piece = GamePiece(type: PlayerType.Player1, row: move.row!, col: move.col!)
                        self.boardView!.addPiece(piece, row: move.row!, col: move.col!)
            
                        boardPieces[move.row!][move.col!] = piece
                        
                        for view in self.boardView!.subviews {
                            if view as? NSObject == previouslySelectedPiece {
                                view.removeFromSuperview
                                
                            }
                        }
                       
                        self.boardView?.setNeedsDisplay()
                       
                        
                        
                        // change the animationDuration (moveToTile returns a duration)
                        
                        
                        
                        
                        //animationDuration = checker.moveToTile(touched, animate: true)
                        
                    }
                }
            }
           
            else {
                previouslySelectedPiece = nil
            }
      

        }
        
        
      
        
        
     

      
        
        
            
        
        
        
    }
    
    

    func getValidMoveOptions(gamePiece: GamePiece) -> [GamePiece] {
        var options : [GamePiece?] = []
        if (gamePiece.type == PlayerType.Player1 || gamePiece.type == PlayerType.Player1King) {
            
            // Diagonals up-lef and up right
            
            
            var row = gamePiece.row!
            var col = gamePiece.col!
            
            
        
            if let option1 = boardPieces[col + 1][row + 1]? {
                options.append(option1)
            }
            
            if let option2 = boardPieces[col - 1][row + 1]? {
                options.append(option2)
            }
           
            
           
            
           
        }
        if (gamePiece.type == PlayerType.Player2 || gamePiece.type == PlayerType.Player2King)  {
            
            // Diagonals below left and below right
            
            var row = gamePiece.row!
            var col = gamePiece.col!
            
       
            options.append(boardPieces[col + 1][row - 1]?)
            
            options.append(boardPieces[col - 1][row - 1]?)

            
            }
        
        
        
        
        var validOptions : [GamePiece] = []
        
        // safety
        for possibleValid in options {
            if var validTile = possibleValid {
                // if there is no checker then we can move
                if validTile.type == PlayerType.Empty {
                 //   println("VALID OPTION2: Valid col: \(validTile.col), Valid row: \(validTile.row)")
                    validOptions.append(validTile) }
            }
        }
        
        return validOptions
    }

    func colorMoveChoices(gamePiece: GamePiece, color: UIColor) -> Int{
        var moveOptions = getValidMoveOptions(gamePiece)
        
        // the color of these valid options is the color in argument
        for move in moveOptions {
            
        
        }
        
      /*
        if var player = gamePiece.type {
            
            var jumpOptions = getValidJumpOptions(player: player, isKing: checker.king)
            for (jump, _) in jumpOptions {
                
                jump.node.fillColor = color
            }
            return jumpOptions.count + moveOptions.count
        }
*/
        
        return moveOptions.count
        
    }
    

    
    
}

*/