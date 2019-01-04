//
//  classCharacter.swift
//  RPG
//
//  Created by admin on 11/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Character{
    let name: String
    var hp: Int
    var weapon: Weapon
    let baseHp: Int
    init(name: String, hp: Int, weapon: Weapon){
        self.hp = hp
        self.weapon = weapon
        self.name = name
        self.baseHp = hp
    }
    func isAlive() -> Bool{
        return hp > 0
    }
    func isThisACriticalHit() -> Bool{
        let number = Int.random(in: 1 ... 3) // Critical hits will occur randomly and double the dammage or healing of the weapon temporarly
        if number == 1{
            return true
        } else {
            return false
        }
    }
   
    func attack(target: Character){
        let number = Int.random(in: 1 ... 3) // Critical hits will occur randomly and double the dammage or healing of the weapon temporarly
        if number == 1{
           target.hp -= weapon.dmg * 2
        } else {
            target.hp -= weapon.dmg
        }
    }
    func validHealthPoints(){
        if hp > baseHp{  // This is to prevent a Character for having more health points than he should
            hp = baseHp
        } else if hp < 0{
            hp = 0
        }
    }
}
