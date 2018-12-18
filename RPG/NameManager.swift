//
//  nameManager.swift
//  RPG
//
//  Created by admin on 11/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class NameManager{
    private static var tab = [String]()   // This array will contain all the names and compare them to each other to make sure every name is unique
    private init(){}
    static func checkName(str: String) -> Bool{
        if tab.contains(str){
            return false
        } else{
            tab.append(str)
            return true
        }
    }
}
