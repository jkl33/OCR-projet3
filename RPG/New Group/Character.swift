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
    var hp: Int{
         didSet{
            if hp > baseHp{  // This is to prevent a Character for having more health points than he should
                hp = baseHp
            } else if hp < 0{
                hp = 0
            }
        }
    }
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
    func attack(target: Character) -> AttackResult{
        let oldTargetHp = target.hp
        if isThisACriticalHit(){
           target.hp -= weapon.dmg * 2
            print("❗️Critical hit❗️")
            return AttackResult.init(dammages: oldTargetHp - target.hp, isCritical: true)
        } else {
            target.hp -= weapon.dmg
            return AttackResult.init(dammages: oldTargetHp - target.hp, isCritical: false)
        }
    }
    private func isThisACriticalHit() -> Bool{
        return Int.random(in: 1 ... 3) == 1   // Critical hits have a 33 % chance of occuring and double the dammage or healing of the weapon temporarly
    }
}
