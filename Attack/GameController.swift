//
//  GameController.swift
//  Attack
//
//  Created by Alan Fullilove on 2/15/16.
//  Copyright © 2016 BASoft. All rights reserved.
//

import Foundation

class GameController
{
    
    enum Players {
        case Player1
        case Player2
    }
    
    private var player1: Character!;
    private var player2: Character!;
    
    private var pHp:Int!;
    private var pAp:Int! = 0;
    
    init () {
        var pHp:Int = self.generateRandomness(40, randomness: 5)
        var pAp:Int = self.generateRandomness(10, randomness: 2)
        
        player1 = Character(hp: pHp, attackPwr: pAp, charName: "Grumble");
        
        pHp = self.generateRandomness(50, randomness: 6)
        pAp = self.generateRandomness(15, randomness: 3)
        
        player2 = Character(hp: pHp, attackPwr: pAp, charName: "Sparky");
    }
    
    func playerInfo() -> String {
        var infoMsg:String = "\(player1.playerName): \(player1.hp)/\(player1.attackPwr)";
        infoMsg += "   \(player2.playerName): \(player2.hp)/\(player2.attackPwr)";
        
        return infoMsg;
    }
    
    func attacking(attack: Players)->String {
        var infoMsg: String;
        
        switch attack {
            case Players.Player1:
                player1.hp -= player2.attackPwr;
                if (isAlive(player1)) {
                    infoMsg = "\(player1.playerName) takes \(player2.attackPwr) HP of damage - \(player1.hp) left";
                } else {
                    infoMsg = "\(player1.playerName) is DEAD!"
                }
            
            case Players.Player2:
                player2.hp -= player1.attackPwr;
                if (isAlive(player2)) {
                    infoMsg = "\(player2.playerName) takes \(player1.attackPwr) HP of damage - \(player2.hp) left";
                } else {
                    infoMsg = "\(player2.playerName) is DEAD!"
            }
        }
        
        return infoMsg;
    }
    
    private func generateRandomness(startingValue:Int, randomness:UInt32) -> Int {
        
        var retVal:Int = startingValue;
        let randVal:Int = random(randomness)
        
        if (randVal > Int(randomness/2)) {
            retVal -= randVal;
        } else {
            retVal += randVal;
        }
        
        return retVal;
    }

    private func random(upperValue: UInt32) ->Int {
        let rand:Int = Int(arc4random_uniform(upperValue))
        
        return rand
    }

    func isAlive(player: Character) -> Bool {
        var retVal: Bool = true;
        
        if (player.hp <= 0) {
            retVal = false;
        }
        
        return retVal;
    }
    
    func generateNewCharacter(player: Players)
    {
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self,
            selector: "generateNewCharacter", userInfo: nil, repeats: false)
    }
    

}
