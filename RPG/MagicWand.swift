//
//  MagicWand.swift
//  RPG
//
//  Created by admin on 18/12/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class MagicWand: Weapon {
    init() {
        super.init(name: "magicWand", dmg: Int.random(in: -100 ... -1))
    }
}
