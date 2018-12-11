//
//  Game.swift
//  RPG
//
//  Created by admin on 13/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation


class Game{
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
    
    func start(){
        print("Welcome to my awesome game, this is a two player game. Each player have to make a team of three characters and then they fight each other untill one player's team is dead. \nThere is three types of characters: \nWarrior 🗡, the typical Warrior, reliable \nMage 🔮, he can heal his allies \nTank 🛡, He has a lot of health points but doesnt deal a lot of dammage \nDwarf 🔨, Does a lot of dommage but has very few health points \n")
        print("Player 1 what's your name ?")
        let player1 = Player(name: getName())
        print("Player 2 what's your name ?")
        let player2 = Player(name: getName())
        for _ in 0...2{
            makeTheTeam(Player: player1)
            makeTheTeam(Player: player2)
        }
        var turns = 0
        while player1.isTeamAlive() && player2.isTeamAlive(){
            attackRound(attacker: player1, victim: player2)
            turns += 1
            if player2.isTeamAlive() && player1.isTeamAlive(){
                attackRound(attacker: player2, victim: player1)
                turns += 1
            }
        }
        if player1.isTeamAlive(){
            print("🎉 Congratulations", player1.name, "🎉", "you won in", turns, "turns !")
        } else if player2.isTeamAlive(){
            print("🎉 Congratulations", player2.name, "🎉", "you won in", turns, "turns !")
        }
    }
    func makeTheTeam(Player: Player){
        print(Player.name, "What's the name of character", Player.team.count + 1, "?")
        let tmp = getName()
        print("And what's his type ?"
            + "\n1. Warrior 🗡"
            + "\n2. Mage 🔮"
            + "\n3. Tank 🛡"
            + "\n4. Dwarf 🔨"
        )
        var i = 0
        while i != 1{
        if let choice = readLine(){
            switch choice {
            case "1":
                Player.team.append(Warrior.init(name: tmp))
                i = 1
            case "2":
                Player.team.append(Mage.init(name: tmp))
                i = 1
            case "3":
                Player.team.append(Tank.init(name: tmp))
                i = 1
            case "4":
                Player.team.append(Dwarf.init(name: tmp))
                i = 1
            default:
                print("You need to pick a type.")
                }
            }
        }
    }
    func displayA(team: [Character]){
        for index in team.indices{
            if team[index].isAlive(){
                print(index, team[index].name, team[index].hp, "health points")
            }
        }
    }
    func attackRound(attacker: Player, victim: Player){
        displayA(team: attacker.team)
        print("\n")
        displayA(team: victim.team)
        print("\n")
        print(attacker.name, "Pick someone to play with")
        let attackerChar = chooseCharacterIn(team: attacker.team)
        let aChest = Chest.init()
        aChest.giveAWeaponTo(aCharacter: attackerChar)
        print(attacker.name, "Pick a target")
        var victimChar: Character
        if attackerChar.weapon.dmg < 0{
            victimChar = chooseCharacterIn(team: attacker.team)
            if victimChar.hp - attackerChar.weapon.dmg > victimChar.baseHp{
                print("🔮\n", attackerChar.name, "gave", victimChar.name, victimChar.baseHp - victimChar.hp, "health points")
            } else {
                print("🔮\n", attackerChar.name, "gave", victimChar.name, attackerChar.weapon.dmg * -1, "health points")
            }
        } else {
            victimChar = chooseCharacterIn(team: victim.team)
            print("⚔️\n", attackerChar.name, "did", attackerChar.weapon.dmg, "dammages to", victimChar.name)
        }
        attackerChar.attack(target: victimChar)
    }
    func chooseCharacterIn(team: [Character]) -> Character{
        for index in team.indices{
            if team[index].isAlive(){
                print(index, team[index].name)
            }
        }
        if let choice = readLine(){
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
