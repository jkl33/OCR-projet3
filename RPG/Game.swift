//
//  Game.swift
//  RPG
//
//  Created by admin on 13/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation


class Game{
    
    // Thanks to NameManager.swift, this function will check if every name is valid
    private func getName() -> String{
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
    
    // This function explain the game to the players and is using every other function to make the game work
    func start(){
        print("Welcome to my awesome game, this is a two player game. Each player have to make a team of three characters and then they fight each other untill one player's team is dead. \nThere is three types of characters: \nWarrior 🗡, the typical Warrior, reliable \nMage 🔮, he can heal his allies \nTank 🛡, He has a lot of health points but doesnt deal a lot of dammage \nDwarf 🔨, Does a lot of dommage but has very few health points \n")
        print("Player 1 what's your name ?")
        let player1 = Player(name: getName())
        print("Player 2 what's your name ?")
        let player2 = Player(name: getName())
        for _ in 0...2{                       // Both players make their team character by character, i used "for" because the teams should be made of 3 characaters
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
    
    // This function ask each player to pick a type and a name for each character, the function will restart if the player imput something wrong such as an invalid name
    private func makeTheTeam(player: Player){
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
                player.team.append(Warrior.init(name: getName()))
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
                makeTheTeam(player: player)
            }
        }
    }
    
    // This function displays the team by going through each character of the array using the indices
    private func displayA(team: [Character]){
        for index in team.indices{
            if team[index].isAlive(){
                print(index, team[index].name, team[index].hp, "health points")
            }
        }
    }
    
    // Same as displayA() this function displays the team and also return the character choosen by the player
    private func chooseCharacterIn(team: [Character]) -> Character{
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
    
    // This function let the player know what weapon did the chest gave the character about to attack
    private func printWeaponOfChest(aCharacter: Character){
        if aCharacter is Mage{
            print("🎁","A chest just appeared, it contains a",  aCharacter.weapon.name, aCharacter.name, "equiped it.", "The weapon can heal for", aCharacter.weapon.dmg, "health points")
        } else {
            print("🎁","A chest just appeared, it contains a",  aCharacter.weapon.name, aCharacter.name, "equiped it.", "The weapon has", aCharacter.weapon.dmg, "dammage power")
        }
    }
    
    // This function displays the dammages of the attack thanks to AttackResult.swift and let the player know if the target of the attacker is dead
    private func displayTheAttack(attacker: Character, target: Character){
        if attacker.weapon.dmg < 0{ // If the weapon of the attacker has a negative value i need to display that the target got healed.
            print("🔮", attacker.name, "gave", attacker.attack(target: target).dammages, "health points to", target.name)
        } else {
       print("⚔️", attacker.name, "did", attacker.attack(target: target).dammages, "dammages to", target.name)
        }
        if target.isAlive() == false{
            print(target.name, "is dead 💀")
        }
    }
    
    // Using most of the functions above this function is everything that is happening in a "turn"
    private func attackRound(attacker: Player, victim: Player){
        displayA(team: attacker.team); print("\n"); displayA(team: victim.team); print("\n") // Starting the round by displaying each team so the player know what to do
        print(attacker.name, "Pick someone to play with")
        let attackerChar = chooseCharacterIn(team: attacker.team)
        let aChest = Chest.init()
        let number = Int.random(in: 1 ... 3)
        if number == 1{
        aChest.giveAWeaponTo(aCharacter: attackerChar) // The chest has a 33 % chance of occuring and give a weapon to the character who is about to attack
        printWeaponOfChest(aCharacter: attackerChar)
        }
        if attackerChar.weapon is MagicWand{
            print("The MagicWand 🖋 will heal for a random amount of health points")
        } else if attackerChar.weapon is MagicGlove{
            print("The MagicGlove 🧤 will deal a random amount of dammages")
        }
        print(attacker.name, "Pick a target")
        let victimChar: Character
        if attackerChar.weapon.dmg < 0{
            victimChar = chooseCharacterIn(team: attacker.team)
        } else {
            victimChar = chooseCharacterIn(team: victim.team) // I present to the player his own team since the mage is suppose to heal his allies or himself
        }
        displayTheAttack(attacker: attackerChar, target: victimChar)
    }
}

