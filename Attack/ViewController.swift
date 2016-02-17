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
    
    @IBOutlet weak var p1Img: UIImageView!
    @IBOutlet weak var p2Img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameMsg.text = "";
        gc = GameController();
        
        gameMsg.text = gc.playerInfo();
    }
    
    @IBAction func p1AttackTapped(sender: AnyObject) {
        gameMsg.text = gc.attacking(GameController.Players.Player2);
        if (gameMsg.text!.lowercaseString.containsString("dead")) {
            self.p2Img.hidden = true;
            gc.regenerate(GameController.Players.Player1)
            gc.regenerate(GameController.Players.Player2)
            timeIt(2)
            //p2Img.hidden = false;
        }
    }

    @IBAction func p2AttackTapped(sender: AnyObject) {
        gameMsg.text = gc.attacking(GameController.Players.Player1);
        if (gameMsg.text!.lowercaseString.containsString("dead")) {
            self.p1Img.hidden = true;
            gc.regenerate(GameController.Players.Player1)
            gc.regenerate(GameController.Players.Player2)
            timeIt(2)
        }
    }
    
    func resumeGame (){
        p1Img.hidden = false;
        p2Img.hidden = false;
        gameMsg.text = "";
    }
    
    func timeIt(delay: NSTimeInterval)
    {
        NSTimer.scheduledTimerWithTimeInterval(delay, target: self,
            selector: "resumeGame", userInfo: nil, repeats: false)
    }

}

