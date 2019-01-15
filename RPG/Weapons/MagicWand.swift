//
//  MagicWand.swift
//  RPG
//
//  Created by admin on 18/12/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class MagicWand: Weapon {
    override var dmg: Int{
        get{
            return Int.random(in: -100 ... -1)
        }
        set{
           
        }
    }
    init() {
        super.init(name: "the MagicWand 🖋, the ammount of health points the MagicWand 🖋 can give changes every turn. ", dmg: 0)
    }
}
