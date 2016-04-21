import Foundation

class Character {
    var labbnamn: String?
    var upprorsnamn: String?
    var djurtyp: AnimalType? {
        return art?.animalType()
    }
    var art: Species?
    var ålder: Age?
    var syssla: Role?
    var rang: Int?
    var kön: Gender?
    
    var ansikte: String?
    var kropp: String?
    var kläder: String?
    
    // Attribute scores
    var styrka: Int?
    var kyla: Int?
    var skärpa: Int?
    var instinkt: Int?
    
    var färdigheter: [Skill: Int]?
    var talang: Talent?
    
    // Gear
    var ransonerKrubb: Int?  // Grub
    var ransonerVatten: Int? // Water
}

enum Gender {
    case Hona
    case Hane
}

enum Age {
    case Ungdjur
    case Mogen
    case Äldste
    
    func string() -> String {
        switch self {
        case .Ungdjur: return "Ungdjur"
        case .Mogen:   return "Mogen"
        case .Äldste:  return "Äldste"
        }
    }
    
    func skillPoints() -> Int {
        switch self {
        case .Ungdjur: return 8
        case .Mogen:   return 10
        case .Äldste:  return 12
        }
    }
}
