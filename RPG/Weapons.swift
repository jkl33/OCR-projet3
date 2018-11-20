//
//  weapons.swift
//  RPG
//
//  Created by admin on 11/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Weapon{
    let name: String
    let dmg: Int
    init(name: String, dmg: Int){
        self.name = name
        self.dmg = dmg
    }
}
var wpWarrior1 = Weapon(name: "weaponWarrior1", dmg: 100)
var wpWarrior2 = Weapon(name: "weaponWarrior2", dmg: 20)
var wpMage1 = Weapon(name: "weaponMage1", dmg: -10)
var wpMage2 = Weapon(name: "weaponMage2", dmg: -20)
var wpTank1 = Weapon(name: "weaponTank1", dmg: 5)
var wpTank2 = Weapon(name: "weaponTank2", dmg: 10)
var wpDwarf1 = Weapon(name: "weaponDwarf1", dmg: 15)
var wpDwarf2 = Weapon(name: "weaponDwarf2", dmg: 30)
