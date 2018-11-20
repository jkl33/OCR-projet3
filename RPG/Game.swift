//
//  Game.swift
//  RPG
//
//  Created by admin on 13/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Game{

    var n = 0
    var y = 1
    func start(){
        print("Player 1 what's your name ?")
        let namePlayer1 = getName()
        print("Player 2 what's your name ?")
        let namePlayer2 = getName()
        while y < 4{
        print(NameManager.tab[n], "What's the name of character", y, "?")
        var tmp1 = getName()
        print("And what's his type ?"
            + "\n1. Warrior"
            + "\n2. Mage"
            + "\n3. Tank"
            + "\n4. Dwarf"
        )
        if let choice = readLine() {
            switch choice {
            case "1":
                Player.teams.append(Warrior.init(name: tmp1))
                if n == 0{
                    n += 1
                } else {
                    y += 1
                    n -= 1
                }
            case "2":
                Player.teams.append(Mage.init(name: tmp1))
                if n == 0{
                    n += 1
                } else {
                    y += 1
                    n -= 1
                }
            case "3":
                Player.teams.append(Tank.init(name: tmp1))
                if n == 0{
                    n += 1
                } else {
                    y += 1
                    n -= 1
                }
            case "4":
                Player.teams.append(Dwarf.init(name: tmp1))
                if n == 0{
                    n += 1
                } else {
                    y += 1
                    n -= 1
                }
            default:
                print("You need to pick a type.")
            }
        }
    }
}
        func fight() {
            while Player.teams[0].hp > 0 && Player.teams[2].hp > 0 && Player.teams[4].hp > 0 || Player.teams[1].hp > 0 && Player.teams[3].hp > 0 && Player.teams[5].hp > 0{
                print(Player.teams[0].hp, Player.teams[1].hp, Player.teams[2].hp, Player.teams[3].hp, Player.teams[4].hp, Player.teams[5].hp)
                print(NameManager.tab[Player.p], "pick a character to play with"
                    + "\n1.", Player.teams[Player.i].name
                    + "\n2.", Player.teams[Player.i + 2].name
                    + "\n3.", Player.teams[Player.i + 4].name
            )
            if let choice = readLine() {
                switch choice {
                case "1":
                    if Player.teams[Player.i].hp < 1{
                        print(Player.teams[Player.i].name,"is dead, pick someone else")
                        return fight()
                    }
                    print()
                case "2":
                    if Player.teams[Player.i + 2].hp < 1{
                        print(Player.teams[Player.i + 2].name,"is dead, pick someone else")
                        return fight()
                    }
                    Player.i += 2
                case "3":
                    if Player.teams[Player.i + 4].hp < 1{
                        print(Player.teams[Player.i + 4].name,"is dead, pick someone else")
                        return fight()
                    }
                    Player.i += 4
                default:
                    print("You need to pick someone.")
                }
        }
            print(NameManager.tab[Player.p], "pick a target"
                    + "\n1.", Player.teams[Player.t].name
                    + "\n2.", Player.teams[Player.t + 2].name
                    + "\n3.", Player.teams[Player.t + 4].name
            )
            if let choice = readLine() {
                switch choice {
                case "1":
                    if Player.teams[Player.t].hp < 1{
                        print(Player.teams[Player.t].name,"is dead, pick someone else")
                        return fight()
                    }
                    Player.teams[Player.t].hp -= Player.teams[Player.i].weapon.dmg
                    print(Player.teams[Player.t].name, "took", Player.teams[Player.i].weapon.dmg, "dammage from", Player.teams[Player.i].name)
                    print(Player.teams[Player.t].hp)
                    Player.turn += 1
                case "2":
                    if Player.teams[Player.t + 2].hp < 1{
                        print(Player.teams[Player.t + 2].name,"is dead, pick someone else")
                        return fight()
                    }
                    Player.teams[Player.t + 2].hp -= Player.teams[Player.i].weapon.dmg
                    print(Player.teams[Player.t + 2].name, "took", Player.teams[Player.i].weapon.dmg, "dammage from", Player.teams[Player.i].name)
                    print(Player.teams[Player.t + 2].hp)
                    Player.turn += 1
                case "3":
                    if Player.teams[Player.t + 4].hp < 1{
                        print(Player.teams[Player.t + 4].name,"is dead, pick someone else")
                        return fight()
                    }
                    Player.teams[Player.t + 4].hp -= Player.teams[Player.i].weapon.dmg
                    print(Player.teams[Player.t + 4].name, "took", Player.teams[Player.i].weapon.dmg, "dammage from", Player.teams[Player.i].name)
                    print(Player.teams[Player.t + 4].hp)
                    Player.turn += 1
                default:
                    print("You need to pick someone.")
                }
            }
                if Player.t == 1{
                    Player.i = 1
                    Player.t = 0
                    Player.p = 1
                } else {
                    Player.i = 0
                    Player.t = 1
                    Player.p = 0
                }
    }
            return end()
}
    func end(){
        print("Congratulation", NameManager.tab[Player.t], "you won in", Player.turn, "turns !")
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

}
