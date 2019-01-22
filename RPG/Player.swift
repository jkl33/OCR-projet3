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
    let name: String
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
    // This function ask each player to pick a type and a name for each character, the function will restart if the player imput something wrong such as an invalid name
    func makeTheTeam(player: Player){
        print(player.name, "what's the type of character", player.team.count + 1, "?"
            + "\n1. Warrior 🗡"
            + "\n2. Mage 🔮"
            + "\n3. Tank 🛡"
            + "\n4. Dwarf 🔨"
        )
        if let choice = readLine(){
            switch choice {
            case "1":
                print("And whats's his name ?")
                player.team.append(Warrior.init(name: NameManager.getName()))
            case "2":
                print("And whats's his name ?")
                player.team.append(Mage.init(name: NameManager.getName()))
            case "3":
                print("And whats's his name ?")
                player.team.append(Tank.init(name: NameManager.getName()))
            case "4":
                print("And whats's his name ?")
                player.team.append(Dwarf.init(name: NameManager.getName()))
            default:
                print("You need to pick a type.")
                makeTheTeam(player: player)
            }
        }
    }
    // Same as displayA() this function displays the team and also return the character choosen by the player
    func chooseCharacterIn(team: [Character]) -> Character{
        for index in team.indices{
            if team[index].isAlive(){
                print(index, team[index].name)
            }
        }
        if let choice = readLine(){ // using readLine() to have what the player imputed
            if let choiceint = Int(choice), team.indices.contains(choiceint) && team[choiceint].isAlive(){
                return team[choiceint]
            } else {
                print("Bad choice")
                return chooseCharacterIn(team: team)
            }
        } else {
            print("something went wrong")
            return chooseCharacterIn(team: team)
        }
    }
}
