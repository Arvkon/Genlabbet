import Foundation

enum Species {
    // Ape
    case chimpanzee
    case gorilla
    case orangutan
    
    // Badger
    case badger
    case marten // Not in English version of the game
    case weasel
    case wolverine
    
    // Bear
    case bear
    case raccoon
    
    // Cat
    case cat
    case cougar // Not in Swedish version of the game
    case lynx
    
    // Dog
    case dog
    case fox
    case wolf

    // Moose (Not in Swedish version of the game)
    //case deer
    //case moose
    //case reindeer
    
    // Rabbit
    case hare
    case rabbit
    
    // Rat
    case hamster // Not in English version of the game
    case mouse
    case rat
    case squirrel // Not in Swedish version of the game
    case vole // Not in English version of the game
    
    // Reptile
    case frog
    case lizard
    case toad
    case turtle
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .chimpanzee: return "Schimpans"
        case .gorilla:    return "Gorilla"
        case .orangutan:  return "Orangutang"
            
        case .badger:     return "Grävling"
        case .marten:     return "Mård"
        case .weasel:     return "Vessla"
        case .wolverine:  return "Järv"

        case .bear:       return "Brunbjörn"
        case .raccoon:    return "Tvättbjörn"
            
        case .cat:        return "Katt"
        case .cougar:     return "Puma"
        case .lynx:       return "Lodjur"
            
        case .dog:        return "Hund"
        case .fox:        return "Räv"
        case .wolf:       return "Varg"
            
        case .hare:       return "Hare"
        case .rabbit:     return "Kanin"
            
        case .hamster:    return "Hamster"
        case .mouse:      return "Mus"
        case .rat:        return "Råtta"
        case .squirrel:   return "Ekorre"
        case .vole:       return "Sork"
            
        case .frog:       return "Groda"
        case .lizard:     return "Ödla"
        case .toad:       return "Padda"
        case .turtle:     return "Sköldpadda"
        }
    }
    
    var animalType: AnimalType {
        switch self {
        case .chimpanzee, .gorilla, .orangutan:        return .ape
        case .badger, .marten, .weasel, .wolverine:    return .badger
        case .bear, .raccoon:                          return .bear
        case .cat, .cougar, .lynx:                     return .cat
        case .dog, .fox, .wolf:                        return .dog
        case .hare, .rabbit:                           return .rabbit
        case .hamster, .mouse, .rat, .squirrel, .vole: return .rat
        case .frog, .lizard, .toad, .turtle:           return .reptile
        }
    }
}
