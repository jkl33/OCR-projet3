//
//  nameManager.swift
//  RPG
//
//  Created by admin on 11/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class NameManager{
    static var tab = [String]()
    private init(){}
    static func checkName(str: String) -> Bool{
        if tab.contains(str){
            print("This name is already taken, pick another one.")
            return false
        } else{
            tab.append(str)
            return true
        }
    }
}
