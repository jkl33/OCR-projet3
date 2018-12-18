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
                print("This name is already taken, pick another one.") // In this case i want the player to enter a valide name
                return getName()
            }
        } else {
            print("This name is already taken, pick another one.") // This is in case the readline() failed
            return getName()
        }
    }
    
    func start(){
        print("Welcome to my awesome game, this is a two player game. Each player have to make a team of three characters and then they fight each other untill one player's team is dead. \nThere is three types of characters: \nWarrior 🗡, the typical Warrior, reliable \nMage 🔮, he can heal his allies \nTank 🛡, He has a lot of health points but doesnt deal a lot of dammage \nDwarf 🔨, Does a lot of dommage but has very few health points \n")
        print("Player 1 what's your name ?")
        let player1 = Player(name: getName())
        print("Player 2 what's your name ?")
        let player2 = Player(name: getName())
        for _ in 0...2{                       // Both players make their team character by character, i used for because the teams should be made of 3 characaters
            makeTheTeam(player: player1)
            makeTheTeam(player: player2)
        }
        var turns = 0
        while player1.isTeamAlive() && player2.isTeamAlive(){ // I need to make sure the attacker and the victim are both alive so the game isn't stuck in an infinite loop
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
                player.team.append(Warrior.init(name: getName()))// I use getname once again so the player will be asked to enter a valide name over and over untill he does
            case "2":
                print("And whats's his name ?")
                player.team.append(Mage.init(name: getName()))
            case "3":
                print("And whats's his name ?")
                player.team.append(Tank.init(name: getName()))
            case "4":
                print("And whats's his name ?")
                player.team.append(Dwarf.init(name: getName()))
            default:
                print("You need to pick a type.")
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
        displayA(team: attacker.team) // Starting the round by displaying each team so the player know what to do
        print("\n")
        displayA(team: victim.team)
        print("\n")
        print(attacker.name, "Pick someone to play with")
        let attackerChar = chooseCharacterIn(team: attacker.team)
        let aChest = Chest.init()
        aChest.giveAWeaponTo(aCharacter: attackerChar) // The chest will occur randomly and give a weapon to the character who is about to attack
        print(attacker.name, "Pick a target")
        var victimChar: Character
        if attackerChar.weapon.dmg < 0{
            victimChar = chooseCharacterIn(team: attacker.team)
        } else {
          victimChar = chooseCharacterIn(team: victim.team) // I present to the player his own team since the mage is suppose to heal his allies or himself
        }
        attackerChar.attack(target: victimChar)
    }
    func chooseCharacterIn(team: [Character]) -> Character{
        for index in team.indices{
            if team[index].isAlive(){
                print(index, team[index].name) // I used the indices of the team array so all i need to do is use readLine() to have what the player imputed
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
