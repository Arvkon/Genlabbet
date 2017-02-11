import Foundation

class Character {
    var labName: String?
    var resistanceName: String?
    var species: Species?
    var age: Age?
    var role: Role?
    var gender: Gender?

    var animalType: AnimalType? {
        return species?.animalType
    }

    var rank: Int {
        var rank = 0
        if let age = age { rank += age.rankBonus }
        if let role = role { rank += role.rankBonus }
        return rank
    }

    // Appearance
    var face: String?
    var body: String?
    var wear: String? // Clothing
    
    // Attribute scores
    var strength: Int?
    var agility: Int?
    var wits: Int?
    var instinct: Int?
    
    var skills: [Skill: Int]?
    var talent: Talent?
    
    // Gear
    var foodRations: Int?
    var waterRations: Int?
}

enum Gender {
    case male
    case female
}

enum Age {
    case youngster
    case mature
    case elder
    
    var string: String {
        switch self {
        case .youngster: return "Ungdjur"
        case .mature:    return "Mogen"
        case .elder:     return "Äldste"
        }
    }
    
    var skillPoints: Int {
        switch self {
        case .youngster: return 8
        case .mature:    return 10
        case .elder:     return 12
        }
    }
    
    var rankBonus: Int {
        switch self {
        case .youngster: return 2
        case .mature:    return 4
        case .elder:     return 6
        }
    }
}
