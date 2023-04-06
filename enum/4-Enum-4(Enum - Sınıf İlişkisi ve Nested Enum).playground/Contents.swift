import UIKit


class CharacterProfile {
    
    enum CharacterType {
        case Priest
        case Warrior
        case Mage
    }
    
    enum Ability {
        case Strengh
        case Intelligence
        case Power
        case Spirit
    }
    
    enum Skill {
        case Climb
        case Hiding
        case Tracker
        case Forest_Lore
    }
    
    var characterType : CharacterType
    var skill : Skill
    var ability : Ability
    
    init(characterType : CharacterType , skill : Skill , ability : Ability) {
        self.characterType = characterType
        self.skill = skill
        self.ability = ability
    }
    
}

var c1 : CharacterProfile  = CharacterProfile(characterType: CharacterProfile.CharacterType.Warrior, skill: CharacterProfile.Skill.Hiding, ability: CharacterProfile.Ability.Intelligence)

print(c1.ability)
print(c1.characterType)
print(c1.skill)



enum GameStuff {
    
    enum Charge : Int {
        case Bow = 10
        case Iron = 5
        case Knife = 9
        case Gun = 12
    }
    
    enum DamageLevel : Int {
        
        case Low
        case Medium
        case High
    }
    
    case Weapon(damageLevel : DamageLevel , charge : Charge)
    
    func getProfile() -> String {
        
        switch self {
            
        case let .Weapon(damageLevel , charge) :
            return "Damage Level : \(damageLevel)\nCharge : \(charge)"
        }
        
    }
}

let gs1 = GameStuff.Weapon(damageLevel: GameStuff.DamageLevel.High, charge: GameStuff.Charge.Knife)
print(gs1.getProfile())
