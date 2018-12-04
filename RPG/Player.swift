//
//  ClassPlayer.swift
//  RPG
//
//  Created by admin on 17/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Player{
    var team = [Character]()
    var name: String
    init(name: String) {
        self.name = name
    }
    func isTeamAlive() -> Bool {
        for character in team{
            if character.isAlive(){
                return true
            }
        }
        return false
    }
}
