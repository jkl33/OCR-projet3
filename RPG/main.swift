//
//  main.swift
//  RPG
//
//  Created by admin on 01/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

var characTab = [Character]()
var j = NameManager.tab.count
//let y = NameManager.tab.count   pourquoi ça ne marche pas ?
var i = 0
func makeTheTeam(){
    print("Player 1 what's your name ?")
    if let namePlayer1 = readLine(){
        if NameManager.checkName(str: namePlayer1) == true{
       print("Bonjour", namePlayer1)
        }
    }
        while(i != 1){
    print("Player 2 what's your name ?")
    if let namePlayer2 = readLine(){
        if NameManager.checkName(str: namePlayer2) == true{
        print("Bonjour", namePlayer2)
            i = 1
            }
        }
    }
        while(i != 2){
            print(NameManager.tab[0], "what's the name of your first character ?")
            if let temporaryName1 = readLine(){
                if NameManager.checkName(str: temporaryName1) == true{
                    i = 2
                }
            }
        }
        while(characTab.count != 1){
            print(NameManager.tab[0], "what's the type of", NameManager.tab[2], "?"
                + "\n1. Warrior"
                + "\n2. Mage"
                + "\n3. Tank"
                + "\n4. Dwarf"
            )
                    if let choice = readLine() {
                        switch choice {
                        case "1":
                            characTab.append(Character.init(name: NameManager.tab[2], hp: 100, weapon: wpWarrior1))
                        case "2":
                            characTab.append(Character.init(name: NameManager.tab[2], hp: 100, weapon: wpMage1))
                        case "3":
                            characTab.append(Character.init(name: NameManager.tab[2], hp: 100, weapon: wpTank1))
                        case "4":
                            characTab.append(Character.init(name: NameManager.tab[2], hp: 100, weapon: wpDwarf1))
                        default:
                            print("You need to pick a type.")
                        }
                    }
                }
}
var p1 = "player1"
var p2 = "player2"
var teams = [Warrior.init(name: "war1"), Warrior.init(name: "war2"), Warrior.init(name: "war3"), Warrior.init(name: "war4"), Warrior.init(name: "war5"), Warrior.init(name: "war6")]
var characterWhoAttack = teams[0]
var target = teams[0]
func attack(i: Character,  j: Character){
    i.hp -= j.weapon.dmg
    print(i, "took", j.weapon.dmg, "dammage from", j)
}
while teams[3].hp > 0 && teams[4].hp > 0 && teams[5].hp > 0 || teams[0].hp > 0 && teams[1].hp > 0 && teams[2].hp > 0{
    print(p1, "pick a character"
        + "\n1. war1"
        + "\n2. war2"
        + "\n3. war3"
    )
    if let choice = readLine() {
        switch choice {
        case "1":
            characterWhoAttack = teams[0]
        case "2":
            characterWhoAttack = teams[1]
        case "3":
            characterWhoAttack = teams[2]
        default:
            print("You need to pick a character")
        }
    }
}
func chest(){
    let nbr = arc4random_uniform(10)
    if nbr == 5{
        print("A chest appear with a better weapon in it, do you want to equip it ?"
            + "\n1. Yes"
            + "\n2. No"
        )
        if let choice = readLine() {
            switch choice {
            case "1":
                teams[0].weapon = wpWarrior2
            case "2":
                teams[0].weapon = wpWarrior1
            default:
                print("You need to choose")
            }
        }
    }
}
