import Foundation

enum Species {
    // Apa
    case gorilla
    case orangutang
    case schimpans
    
    // Björn
    case brunbjörn
    case tvättbjörn
    
    // Gnagare
    case hamster
    case mus
    case råtta
    case sork
    
    // Hardjur
    case hare
    case kanin
    
    // Hunddjur
    case hund
    case räv
    case varg
    
    // Kattdjur
    case katt
    case lodjur
    
    // Mårddjur
    case grävling
    case järv
    case mård
    case vessla
    
    // Reptil
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
            
        case .brunbjörn:  return "Brunbjörn"
        case .tvättbjörn: return "Tvättbjörn"
            
        case .hamster:    return "Hamster"
        case .mus:        return "Mus"
        case .råtta:      return "Råtta"
        case .sork:       return "Sork"
            
        case .hare:       return "Hare"
        case .kanin:      return "Kanin"
            
        case .hund:       return "Hund"
        case .räv:        return "Räv"
        case .varg:       return "Varg"
            
        case .katt:       return "Katt"
        case .lodjur:     return "Lodjur"
            
        case .grävling:   return "Grävling"
        case .järv:       return "Järv"
        case .mård:       return "Mård"
        case .vessla:     return "Vessla"
            
        case .groda:      return "Groda"
        case .padda:      return "Padda"
        case .sköldpadda: return "Sköldpadda"
        case .ödla:       return "Ödla"
        }
    }
    
    var animalType: AnimalType {
        switch self {
        case .gorilla, .orangutang, .schimpans:  return .apa
        case .brunbjörn, .tvättbjörn:            return .björn
        case .hamster, .mus, .råtta, .sork:      return .gnagare
        case .hare, .kanin:                      return .hardjur
        case .hund, .räv, .varg:                 return .hunddjur
        case .katt, .lodjur:                     return .kattdjur
        case .grävling, .järv, .mård, .vessla:   return .mårddjur
        case .groda, .padda, .sköldpadda, .ödla: return .reptil
        }
    }
}
