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
        print("Welcome to my awesome game, this is a two player game. Each player have to make a team of three characters and then they fight each other untill one player's team is dead. \n There is three types of characters: \n Warrior 🗡, the typical Warrior, reliable \n Mage 🔮, he can heal his allies \n Tank 🛡, He has a lot of health points but doesnt deal a lot of dammage \n  Dwarf 🔨, Does a lot of dommage but has very few health points \n")
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
        if let choice = readLine(){
            switch choice {
            case "1":
                Player.team.append(Warrior.init(name: tmp))
            case "2":
                Player.team.append(Mage.init(name: tmp))
            case "3":
                Player.team.append(Tank.init(name: tmp))
            case "4":
                Player.team.append(Dwarf.init(name: tmp))
            default:
                print("You need to pick a type.")
                NameManager.tab.removeLast()
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
        Chest(aCharacter: attackerChar)
        print(attacker.name, "Pick a target")
        var victimChar: Character
        if attackerChar.weapon.dmg < 0{ // est-ce que le mage peut donner des hp à un perso full life?
            victimChar = chooseCharacterIn(team: attacker.team)
            print("🔮\n", attackerChar.name, "gave", victimChar.name, attackerChar.weapon.dmg * -1, "health points")
        } else {
            victimChar = chooseCharacterIn(team: victim.team)
            print("⚔️\n", attackerChar.name, "did", attackerChar.weapon.dmg, "dammages to", victimChar.name)
        }
        let number = Int.random(in: 1 ... 3)
        if number == 1{
            criticalHit(aWeapon: attackerChar.weapon)
            attackerChar.attack(target: victimChar)
            unCritical(aWeapon: attackerChar.weapon)
        } else {
        attackerChar.attack(target: victimChar)
        }
        print(victimChar.hp)
    }
    func chooseCharacterIn(team: [Character]) -> Character{
        for index in team.indices{
            if team[index].isAlive(){
                print(index, team[index].name)
            }
        }
        if let choice = readLine(){
            if let choiceint = Int(choice), team.indices.contains(choiceint), team[choiceint].isAlive(){
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
    func Chest(aCharacter: Character){
        let number = Int.random(in: 1 ... 3)
        if aCharacter.weapon.name.contains("super"){
         () // j'ai choisi cette méthode plutôt que changer leurs armes ce qui m'oblige à faire des if dans des if...
        } else if number == 1{
            print("🎁\n", "A chest just appear, it contains a weapon wich have twice as much power", aCharacter.name, "equiped it.")
            aCharacter.weapon.dmg *= 2
            aCharacter.weapon.name = "superWeapon"
        }
        
    }
    func criticalHit(aWeapon: Weapon){
          print("❗️Critical hit❗️ You dealt twice as much.")
            aWeapon.dmg *= 2
    }
    func unCritical(aWeapon: Weapon){
        aWeapon.dmg /= 2
    }
}
