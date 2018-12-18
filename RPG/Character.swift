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
            target.hp -= weapon.dmg * 2 // Critical hits will occur randomly and double the dammage or healing of the weapon temporarly
            if weapon.dmg < 0{
                if target.hp - weapon.dmg * 2 > target.baseHp{
                    print("🔮\n", name, "gave", target.name, target.baseHp - target.hp, "health points")
                } else {
                    print("🔮\n", name, "gave", target.name, weapon.dmg * -2, "health points")
                }
            } else {
                print("⚔️\n", name, "did", weapon.dmg * 2, "dammages to", target.name)
            }
        } else {
            target.hp -= weapon.dmg
            if weapon.dmg < 0{
                if target.hp - weapon.dmg > target.baseHp{
                    print("🔮\n", name, "gave", target.name, target.baseHp - target.hp, "health points")
                } else {
                    print("🔮\n", name, "gave", target.name, weapon.dmg * -1, "health points")
                }
            } else {
                print("⚔️\n", name, "did", weapon.dmg , "dammages to", target.name)
            }
        }
        if target.hp > target.baseHp{  // This is to prevent a Character for having more health points than he should
            target.hp = target.baseHp
        } else if target.hp <= 0{
            target.hp = 0
            print(target.name, "is dead 💀")
        }
    }
}
