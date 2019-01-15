//
//  AttackResult.swift
//  RPG
//
//  Created by admin on 08/01/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import Foundation

class AttackResult{
    let dammages: Int
    let isCritical: Bool
    
    init(dammages: Int, isCritical: Bool) {
        self.dammages = dammages
        self.isCritical = isCritical
    }
}
