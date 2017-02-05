import Foundation

enum Species {
    // Ape
    case gorilla
    case orangutang
    case schimpans
    
    // Badger
    case grävling
    case järv
    case mård
    case vessla
    
    // Bear
    case brunbjörn
    case tvättbjörn
    
    // Cat
    case katt
    case lodjur
    
    // Dog
    case hund
    case räv
    case varg
    
    // Rabbit
    case hare
    case kanin
    
    // Rat
    case hamster
    case mus
    case råtta
    case sork
    
    // Reptile
    case groda
    case padda
    case sköldpadda
    case ödla
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .gorilla:    return "Gorilla"
        case .orangutang: return "Orangutang"
        case .schimpans:  return "Schimpans"
            
        case .grävling:   return "Grävling"
        case .järv:       return "Järv"
        case .mård:       return "Mård"
        case .vessla:     return "Vessla"
            
        case .brunbjörn:  return "Brunbjörn"
        case .tvättbjörn: return "Tvättbjörn"
            
        case .katt:       return "Katt"
        case .lodjur:     return "Lodjur"
            
        case .hund:       return "Hund"
        case .räv:        return "Räv"
        case .varg:       return "Varg"
            
        case .hare:       return "Hare"
        case .kanin:      return "Kanin"
            
        case .hamster:    return "Hamster"
        case .mus:        return "Mus"
        case .råtta:      return "Råtta"
        case .sork:       return "Sork"
            
        case .groda:      return "Groda"
        case .padda:      return "Padda"
        case .sköldpadda: return "Sköldpadda"
        case .ödla:       return "Ödla"
        }
    }
    
    var animalType: AnimalType {
        switch self {
        case .gorilla, .orangutang, .schimpans:  return .ape
        case .grävling, .järv, .mård, .vessla:   return .badger
        case .brunbjörn, .tvättbjörn:            return .bear
        case .katt, .lodjur:                     return .cat
        case .hund, .räv, .varg:                 return .dog
        case .hare, .kanin:                      return .rabbit
        case .hamster, .mus, .råtta, .sork:      return .rat
        case .groda, .padda, .sköldpadda, .ödla: return .reptile
        }
    }
}
