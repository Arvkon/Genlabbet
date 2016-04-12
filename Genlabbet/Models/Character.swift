import Foundation

class Character {
    var labbnamn: String?
    var upprorsnamn: String?
    var djurtyp: AnimalType? {
        return art?.animalType() ?? .Apa // nil
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
    
    // Gear
    var ransonerKrubb: Int?  // Grub
    var ransonerVatten: Int? // Water
}

enum Gender {
    case Hona
    case Hane
}

enum Djurförmåga {
    case Amfibisk
    case Blixtsnabb
    case Flyktsinne
    case Giftbett
    case Grävare
    case Hoppförmåga
    case Jaktsinne
    case Klättrare
    case Liten
    case Ljudlös
    case Lurvig
    case Löpsnabb
    case Nattsyn
    case Pansar
    case Rovattack
    case Stor
    case Svans
    case Varningsrop
    case Växtätare
}

enum Age: Int {
    case Ungdjur
    case Mogen
    case Äldste
}
