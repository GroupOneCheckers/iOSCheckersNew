//
//  ViewController.swift
//  GameBoard
//
//  Created by William McDuff on 2015-02-18.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boardView: GameBoardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //var board = Board()
        
        
        
        //board.boardView = boardView
        
        DataModel.mainData().currentGame = GameModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

