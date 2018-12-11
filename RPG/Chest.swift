//
//  Chest.swift
//  RPG
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Chest{
    func giveAWeaponTo(aCharacter: Character){
        let number = Int.random(in: 1 ... 3)
        if number == 1{
        if aCharacter.weapon.name.contains("Sword"){
            aCharacter.weapon = Weapon.init(name: "randomSword", dmg: Int.random(in: 1 ... 100))
        } else if aCharacter.weapon.name.contains("CrystalBall"){
            aCharacter.weapon = Weapon.init(name: "randomCrystalBall", dmg: Int.random(in: -100 ... -1))
        } else if aCharacter.weapon.name.contains("Shield"){
            aCharacter.weapon = Weapon.init(name: "randomShield", dmg: Int.random(in: 1 ... 100))
        } else if aCharacter.weapon.name.contains("Hammer"){
            aCharacter.weapon = Weapon.init(name: "randomHammer", dmg: Int.random(in: 1 ... 100))
        }
            if aCharacter.weapon.name.contains("CrystalBall"){
                print("🎁\n", "A chest just appear, it contains a random weapon", aCharacter.name, "equiped it.", "The weapon can heal for", -aCharacter.weapon.dmg, "health points")
            } else {
                print("🎁\n", "A chest just appear, it contains a random weapon", aCharacter.name, "equiped it.", "The weapon has", aCharacter.weapon.dmg, "dammage power")
            }
        }
    }
}
