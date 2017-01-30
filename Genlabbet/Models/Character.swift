import Foundation

class Character {
    var labbnamn: String?
    var upprorsnamn: String?
    var djurtyp: AnimalType? {
        return art?.animalType
    }
    var art: Species?
    var ålder: Age?
    var syssla: Role?
    var rang: Int {
        var rank = 0
        if let ålder = ålder { rank += ålder.rankBonus }
        if let syssla = syssla { rank += syssla.rankBonus }
        return rank
    }
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
    case hane
    case hona
}

enum Age {
    case ungdjur
    case mogen
    case äldste
    
    var string: String {
        switch self {
        case .ungdjur: return "Ungdjur"
        case .mogen:   return "Mogen"
        case .äldste:  return "Äldste"
        }
    }
    
    var skillPoints: Int {
        switch self {
        case .ungdjur: return 8
        case .mogen:   return 10
        case .äldste:  return 12
        }
    }
    
    var rankBonus: Int {
        switch self {
        case .ungdjur: return 2
        case .mogen:   return 4
        case .äldste:  return 6
        }
    }
}
