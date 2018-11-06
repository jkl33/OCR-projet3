//
//  main.swift
//  RPG
//
//  Created by admin on 01/11/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class character{

    class Warrior: character {
    init(name: Any){
    var HP = 100
    var attack = 10
        }
}
    class Mage: character {
    init(name: Any){
    var HP = 100
    var heal = 10
    }
}

    class Tank: character {
    init(name: Any){
    var HP = 200
    var attack = 5
    }
}

    class Dwarf: character {
    init(name: Any){
    var HP = 50
    var attack = 20
    }
}
}
func makeTheTeam(){
    var namePlayer1 = String()
    print("Player 1 what's your name ?")
    namePlayer1 = readLine()!
    print("Bonjour", namePlayer1)
    print("what's the name of your first character ?")
    var temporaryName1 = readLine()
    print(namePlayer1, "what's the name of your second character ?")
    var temporaryName2 = readLine()
    while temporaryName1 == temporaryName2{
        print("This name is already taken, pick another one.") //Trouver une meilleur solution pour comparer les noms, le
        print("what's the name of your second character ?")    //code serait énorme si il y avait plus de noms à comparer
        temporaryName2 = readLine()
    }
    print(namePlayer1, "what's the name of your third character ?")
    var temporaryName3 = readLine()
    print(temporaryName2!)
    var team1 = [Any]()
    while team1.count != 1{
        print("What's the type of ", temporaryName1!, "?"
        + "\n1. Warrior"
        + "\n2. Mage"
        + "\n3. Tank"
        + "\n4. Dwarf"
    )
    if let choice = readLine() {
        switch choice {
        case "1":
            //team1.append(character.Warrior(name: temporaryName1!)) // si je veux que le la valeur name du Personnage soit
            team1.append(character.Warrior.self)                     // son nom mais j'utiliserai l'index du tableau pour
                                                                     //  me reperer dans la partie combat
        case "2":
            team1.append(character.Mage.self)
        case "3":
            team1.append(character.Tank.self)
        case "4":
            team1.append(character.Dwarf.self)
        default:
            print("You need to pick a type.")
        }
        }
    }
    while team1.count != 2{
        print("What's the type of ", temporaryName2!, "?"
            + "\n1. Warrior"
            + "\n2. Mage"
            + "\n3. Tank"
            + "\n4. Dwarf"
        )
        if let choice = readLine() {
            switch choice {
            case "1":
                team1.append(character.Warrior.self) // trouver une solution pour ne pas avoir à réecrire le même code 3 fois
            case "2":
                team1.append(character.Mage.self)
            case "3":
                team1.append(character.Tank.self)
            case "4":
                team1.append(character.Dwarf.self)
            default:
                print("You need to pick a type.")
            }
        }
    }
    while team1.count != 3{
        print("What's the type of ", temporaryName3!, "?"
            + "\n1. Warrior"
            + "\n2. Mage"
            + "\n3. Tank"
            + "\n4. Dwarf"
        )
        if let choice = readLine() {
            switch choice {
            case "1":
                team1.append(character.Warrior.self)  //trouver une solution pour ne pas avoir a réecrire tout se code pour
                print(team1)                          // créer la team 2
            case "2":
                team1.append(character.Mage.self)
                print(team1)
            case "3":
                team1.append(character.Tank.self)
                print(team1)
            case "4":
                team1.append(character.Dwarf.self)
                print(team1)
            default:
                print("You need to pick a type.")
            }
        }
    }
}
makeTheTeam()
// Trouver un moyen d'utliser les variables d'une fonction dans une autre pour les noms(global? singleton?)
/*
var name = "noname"
var name2 = "stillnoname"
var team1 = [character.Warrior(name: name), character.Dwarf.self, character.Tank.self] as [Any]
var team2 = [character.Warrior(name: name2), character.Dwarf.self, character.Tank.self] as [Any]

func fight(){
    print("player 1 pick a character and who should he attack"
        + "\n1. team1[1] attack team2[1]"
    )
    if let choice = readLine() {
        switch choice {
        case "1":
            team2[1] = team2[1].HP - team1[1].attack
        default:
            print("You need to pick a character.")
       

}
}
}
*/
