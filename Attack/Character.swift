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
    private var _initialHp:Int = 0;
    private var _hpOffset:UInt32 = 0;
    private var _hp:Int = 0;

    private var _initialAttackPwr:Int = 0;
    private var _apOffset:UInt32 = 0;
    private var _attackPwr:Int = 0;

    private var _name:String;

    var initialHp:Int {
        get {
            return _initialHp;
        }
        set {
            self._initialHp = newValue;
        }
    }
    
    var hpOffset:UInt32 {
        get {
            return _hpOffset;
        }
        set {
            self._hpOffset = newValue;
        }
    }
    
    var hp:Int {
        get {
            return _hp;
        }
        
        set {
            self._hp = newValue;
        }
    }
    
    var initialAttackPwr:Int {
        get {
            return _initialAttackPwr;
        }
        set {
            _initialAttackPwr = newValue;
        }
    }
    
    var apOffset: UInt32{
        get {
            return _apOffset;
        }
        set {
            _apOffset = newValue
        }
    }
    
    var attackPwr:Int {
        get {
            return _attackPwr
        }
        set {
            _attackPwr = newValue;
        }
    }
    
    var playerName:String {
        get {
            return _name;
        }
        set {
            _name = newValue;
        }
    }
    
    
    init(baseHp:Int, hpOffset: UInt32, baseAttackPwr: Int, apOffset: UInt32, charName:String) {
        _initialHp = baseHp;
        _hpOffset = hpOffset;
        
        _initialAttackPwr = baseAttackPwr;
        _apOffset = apOffset;
        
        _name = charName;
        
        self.addRandomnessToPlayerStats();
    }
    
    func regenerate() {
        self.addRandomnessToPlayerStats();        
    }
    
    private func addRandomnessToPlayerStats() {
        var randVal:Int = random(self.hpOffset)
        
        if (randVal > Int(self.hpOffset/2)) {
            self.hp = self.initialHp - randVal;
        } else {
            self.hp = self.initialHp + randVal;
        }
        
        randVal = random(self.apOffset)
        if (randVal > Int(self.apOffset/2)) {
            self.attackPwr = self.initialAttackPwr - randVal;
        } else {
            self.attackPwr = self.initialAttackPwr + randVal;
        }

    }
    
    private func random(upperValue: UInt32) ->Int {
        let rand:Int = Int(arc4random_uniform(upperValue))
        
        return rand
    }
}