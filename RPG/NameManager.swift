//
//  nameManager.swift
//  RPG
//
//  Created by admin on 11/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class NameManager{
    static var tab = [String]()   // This array will contain all the names and compare them to each other to make sure every name is unique
     init(){}
        static func checkName(str: String) -> Bool{
            if NameManager.tab.contains(str) || str.isEmpty{
            return false
        } else {
                NameManager.tab.append(str)
            return true
        }
    }
    // Thanks to NameManager.swift, this function will check if every name is valid
    static func getName() -> String{
        if let name = readLine(){
            if NameManager.checkName(str: name){
                return name
            } else {
                print("This name is already taken, pick another one, your name can't be empty.") // In this case i want the player to enter a valide name
                return getName()
            }
        } else {
            print("This name is already taken, pick another one, your name can't be empty.") // This is in case the readline() failed
            return getName()
        }
    }
}
