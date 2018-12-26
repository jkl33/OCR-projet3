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
            let weaponNumber = Int.random(in: 1 ... 4)
            switch weaponNumber{
            case 1:
                giveABasicWeaponTo(someCharacter: aCharacter)
            case 2:
                giveAGreatWeaponTo(someCharacter: aCharacter)
            case 3:
                giveASuperWeaponTo(someCharacter: aCharacter)
            case 4:
                giveAMagicWeaponTo(someCharacter: aCharacter)
            default:
                print("Something went wrong")
            }
        }
    func giveABasicWeaponTo(someCharacter: Character){
        if someCharacter is Warrior{
            someCharacter.weapon = BasicSword.init()
        } else if someCharacter is Mage{
            someCharacter.weapon = BasicCrystalBall.init()
        } else if someCharacter is Tank{
            someCharacter.weapon = BasicShield.init()
        } else if someCharacter is Dwarf{
            someCharacter.weapon = BasicHammer.init()
        }
    }
    func giveAGreatWeaponTo(someCharacter: Character){
        if someCharacter is Warrior{
            someCharacter.weapon = GreatSword.init()
        } else if someCharacter is Mage{
            someCharacter.weapon = GreatCrystalBall.init()
        } else if someCharacter is Tank{
            someCharacter.weapon = GreatShield.init()
        } else if someCharacter is Dwarf{
            someCharacter.weapon = GreatHammer.init()
        }
    }
    func giveASuperWeaponTo(someCharacter: Character){
        if someCharacter is Warrior{
            someCharacter.weapon = SuperSword.init()
        } else if someCharacter is Mage{
            someCharacter.weapon = SuperCrystalBall.init()
        } else if someCharacter is Tank{
            someCharacter.weapon = SuperShield.init()
        } else if someCharacter is Dwarf{
            someCharacter.weapon = SuperHammer.init()
        }
    }
    func giveAMagicWeaponTo(someCharacter: Character){
        if someCharacter is Warrior{
            someCharacter.weapon = MagicGlove.init()
        } else if someCharacter is Mage{
            someCharacter.weapon = MagicWand.init()
        } else if someCharacter is Tank{
            someCharacter.weapon = MagicGlove.init()
        } else if someCharacter is Dwarf{
            someCharacter.weapon = MagicGlove.init()
        }
    }
    func resetMagicWeaponsTo(aCharacter: Character){
        if aCharacter.weapon is MagicWand{       // The MagicWand and MagicGlove need to change their values even if the chest is not supposed to give a new weapon
            aCharacter.weapon = MagicWand.init()
        } else if aCharacter.weapon is MagicGlove{
            aCharacter.weapon = MagicGlove.init()
        }
    }
}
