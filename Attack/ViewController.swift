//
//  ViewController.swift
//  Attack
//
//  Created by Alan Fullilove on 2/13/16.
//  Copyright © 2016 BASoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gc: GameController!;
    
    @IBOutlet weak var p1AttackBtn: UIButton!
    @IBOutlet weak var p2AttackBtn: UIButton!
    @IBOutlet weak var gameMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameMsg.text = "";
        gc = GameController();
        
        gameMsg.text = gc.playerInfo();
    }
    
    @IBAction func p1AttackTapped(sender: AnyObject) {
        gameMsg.text = gc.attacking(GameController.Players.Player2);
        if (!gc.isAlive(GameController.Players.Player2))
        {
            
        }
    }

    @IBAction func p2AttackTapped(sender: AnyObject) {
        gameMsg.text = gc.attacking(GameController.Players.Player1);
        if (!gc.isAlive(GameController.Players.Player2))
        {
            
        }
    }
}

