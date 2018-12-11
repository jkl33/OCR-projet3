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
    init(name: String, hp: Int, weapon: Weapon, baseHp: Int){
        self.hp = hp
        self.weapon = weapon
        self.name = name
        self.baseHp = baseHp
    }
    func isAlive() -> Bool{
        return hp > 0
    }
    func attack(target: Character){
        let number = Int.random(in: 1 ... 3)
        if number == 1{
            print("❗️Critical hit❗️ You dealt twice as much.")
            target.hp -= weapon.dmg * 2
        } else {
        target.hp -= weapon.dmg
        }
        if target.hp > target.baseHp{
            target.hp = target.baseHp
        }
    }
}
