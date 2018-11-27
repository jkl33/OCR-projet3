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
        private func getName() -> String{
        if let name = readLine(){
            if NameManager.checkName(str: name){
                return name
            } else {
                print("This name is already taken, pick another one.")
                return getName()
            }
        } else {
            print("This name is already taken, pick another one.")
            return getName()
        }
    }
    func makeTheTeam(){
        print(name, "What's the name of character", team.count + 1, "?")
            let tmp = getName()
        print("And what's his type ?"
            + "\n1. Warrior"
            + "\n2. Mage"
            + "\n3. Tank"
            + "\n4. Dwarf"
            )
            if let choice = readLine(){
                switch choice {
                case "1":
                    team.append(Warrior.init(name: tmp))
                case "2":
                    team.append(Mage.init(name: tmp))
                case "3":
                    team.append(Tank.init(name: tmp))
                case "4":
                    team.append(Dwarf.init(name: tmp))
                default:
                    print("You need to pick a type.")
                        NameManager.tab.removeLast()
                }
        }
    }
    func whoIsAttacking(_: [Character]) -> String{
        print(name, "Pick a character to play with")
        if team[0].isAlive(){
            print(team[0].name)
        }
        if team[1].isAlive(){
            print(team[1].name)
        }
        if team[2].isAlive(){
            print(team[2].name)
        }
        if let attacker = readLine(){
                return attacker
            } else {
            return "whatever"
            }
    }
    func whoIsAttacked(_: [Character]) -> String{
        print(name, "Pick a target")
        if team[0].isAlive(){
            print(team[0].name)
        }
        if team[1].isAlive(){
            print(team[1].name)
        }
        if team[2].isAlive(){
            print(team[2].name)
        }
        if let attacked = readLine(){
            return attacked
        } else {
            return "whatever"
        }
    }
}
