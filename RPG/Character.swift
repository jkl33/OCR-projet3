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
    init(name: String, hp: Int, weapon: Weapon) {
        self.hp = hp
        self.weapon = weapon
        self.name = name
    }
    func isAlive() -> Bool{
        return hp > 0
    }
    func attack(target: Character){
        target.hp -= weapon.dmg
    }
}
