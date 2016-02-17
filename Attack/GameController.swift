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
        player1 = Character(baseHp: 40, hpOffset: 10, baseAttackPwr: 10, apOffset: 2,  charName: "Grumble");
        player2 = Character(baseHp: 50, hpOffset: 6, baseAttackPwr: 15, apOffset: 3,  charName: "Sparky");
    }
    
    func regenerate(player: Players) {
        switch player {
            case Players.Player1:
                player1.regenerate();
            case Players.Player2:
                player2.regenerate();
        }
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
                if (isAlive(Players.Player1)) {
                    infoMsg = "\(player1.playerName) takes \(player2.attackPwr) HP of damage - \(player1.hp) left";
                } else {
                    infoMsg = "\(player1.playerName) is DEAD!"
                }
            
            case Players.Player2:
                player2.hp -= player1.attackPwr;
                if (isAlive(Players.Player2)) {
                    infoMsg = "\(player2.playerName) takes \(player1.attackPwr) HP of damage - \(player2.hp) left";
                } else {
                    infoMsg = "\(player2.playerName) is DEAD!"
            }
        }
        
        return infoMsg;
    }
    
    func isAlive(player: Players) -> Bool {
        var retVal: Bool = true;

        switch player {
            case Players.Player1:
                if (player1.hp <= 0) {
                    retVal = false;
                }
            
            case Players.Player2:
                if (player2.hp <= 0) {
                    retVal = false;
                }
        }
        
        return retVal;
    }
}
