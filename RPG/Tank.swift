//
//  classTank.swift
//  RPG
//
//  Created by admin on 11/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Tank: Character {
    init(name: String){
        super.init(name: name, hp: 200, weapon: wpTank1, baseHp: 200)
    }
}
