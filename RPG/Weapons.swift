//
//  weapons.swift
//  RPG
//
//  Created by admin on 11/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Weapon{
    var name: String
    var dmg: Int
    init(name: String, dmg: Int){
        self.name = name
        self.dmg = dmg
    }
}
var wpWarrior1 = Weapon(name: "basicSword", dmg: 100)
var wpMage1 = Weapon(name: "basicCrystalBall", dmg: -10)
var wpTank1 = Weapon(name: "basicShield", dmg: 5)
var wpDwarf1 = Weapon(name: "basicHammer", dmg: 15)

