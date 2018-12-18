//
//  MagicWandForMage.swift
//  RPG
//
//  Created by admin on 18/12/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class MagicGlove: Weapon {
    init() {
        super.init(name: "magicGlove", dmg: Int.random(in: 1 ... 100))
    }
}
