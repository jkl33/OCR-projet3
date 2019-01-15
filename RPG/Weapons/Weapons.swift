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
    var dmg = 0
    init(name: String, dmg: Int){
        self.name = name
        self.dmg = dmg
    }
}

