//
//  Character.swift
//  Attack
//
//  Created by Alan Fullilove on 2/14/16.
//  Copyright © 2016 BASoft. All rights reserved.
//

import Foundation

class Character
{
    private var _hp:Int;
    var hp:Int {
        get {
            return _hp;
        }
        
        set {
            self._hp = newValue;
        }
    }
    
    private var _attackPwr: Int;
    var attackPwr:Int {
        get {
            return _attackPwr
        }
    }
    
    private var _name:String;
    var playerName:String {
        get {
            return _name;
        }
    }
    
    
    init(hp:Int, attackPwr: Int, charName:String) {
        self._hp = hp;
        self._attackPwr = attackPwr;
        self._name = charName;
    }
    
}