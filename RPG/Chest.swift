//
//  Chest.swift
//  RPG
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Jotaro. All rights reserved.
//

import Foundation

class Chest{
    func giveAWeaponTo(aCharacter: Character){
        if aCharacter.weapon is MagicWand{       // The MagicWand and MagicGlove need to change their values even if the chest is not supposed to give a new weapon
            aCharacter.weapon = MagicWand.init()
        } else if aCharacter.weapon is MagicGlove{
            aCharacter.weapon = MagicGlove.init()
        }
        let number = Int.random(in: 1 ... 3)
        let weaponNumber = Int.random(in: 1 ... 4)
        if number == 1{
        if aCharacter is Warrior{
            if weaponNumber == 1{
            aCharacter.weapon = BasicSword.init()    // The Warrior can only equip sword and so on so that the mage never end up with a healing weapon and vice versa
            } else if weaponNumber == 2{
                aCharacter.weapon = GreatSword.init()
            } else if weaponNumber == 3{
                aCharacter.weapon = SuperSword.init()
            }
        }
        if aCharacter is Mage{
            if weaponNumber == 1{
                aCharacter.weapon = BasicCrystalBall.init()
            } else if weaponNumber == 2{
                aCharacter.weapon = GreatCrystalBall.init()
            } else if weaponNumber == 3{
                aCharacter.weapon = SuperCrystalBall.init()
            }
        }
        if aCharacter is Tank{
            if weaponNumber == 1{
                aCharacter.weapon = BasicShield.init()
            } else if weaponNumber == 2{
                aCharacter.weapon = GreatShield.init()
            } else if weaponNumber == 3{
                aCharacter.weapon = SuperShield.init()
            }
        }
        if aCharacter is Dwarf{
            if weaponNumber == 1{
                aCharacter.weapon = BasicHammer.init()
            } else if weaponNumber == 2{
                aCharacter.weapon = GreatHammer.init()
            } else if weaponNumber == 3{
                aCharacter.weapon = SuperHammer.init()
            }
        }
            if weaponNumber == 4 && aCharacter is Mage{
                aCharacter.weapon = MagicWand.init()
            } else if weaponNumber == 4{
                aCharacter.weapon = MagicGlove.init()
            }
            if aCharacter is Mage && aCharacter.weapon is MagicWand{
              print("🎁\n","A chest just appeared, it contains the MagicWand 🖋", aCharacter.name, "equiped it.", "The MagicWand 🖋 can heal for", -aCharacter.weapon.dmg, "health points, the ammount of health points the MagicWand 🖋 can give changes every turn.")
            } else if aCharacter is Mage{
                print("🎁\n","A chest just appeared, it contains a random weapon", aCharacter.name, "equiped it.", "The weapon can heal for", -aCharacter.weapon.dmg, "health points")
            } else if aCharacter.weapon is MagicGlove {
                print("🎁\n","A chest just appeared, it contains the MagicGlove 🧤", aCharacter.name, "equiped it.", "The MagicGlove 🧤 has", aCharacter.weapon.dmg, "dammage power, the ammount dammage the MagicGlove 🧤 can deal changes every turn.")
            } else {
                print("🎁\n","A chest just appeared, it contains a random weapon", aCharacter.name, "equiped it.", "The weapon has", aCharacter.weapon.dmg, "dammage power")
            }
        }
    }
}
