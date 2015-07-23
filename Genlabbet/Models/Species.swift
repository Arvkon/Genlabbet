import Foundation

enum Species {
    // Apa
    case Gorilla
    case Orangutang
    case Schimpans
    
    // Björn
    case Brunbjörn
    case Tvättbjörn
    
    // Gnagare
    case Hamster
    case Mus
    case Råtta
    case Sork
    
    // Hardjur
    case Hare
    case Kanin
    
    // Hunddjur
    case Hund
    case Räv
    case Varg
    
    // Kattdjur
    case Katt
    case Lodjur
    
    // Mårddjur
    case Grävling
    case Järv
    case Mård
    case Vessla
    
    // Reptil
    case Groda
    case Padda
    case Sköldpadda
    case Ödla
    
    // MARK: Methods
    
    func string() -> String {
        switch self {
        case .Gorilla:    return "Gorilla"
        case .Orangutang: return "Orangutang"
        case .Schimpans:  return "Schimpans"
            
        case .Brunbjörn:  return "Brunbjörn"
        case .Tvättbjörn: return "Tvättbjörn"
            
        case .Hamster:    return "Hamster"
        case .Mus:        return "Mus"
        case .Råtta:      return "Råtta"
        case .Sork:       return "Sork"
            
        case .Hare:       return "Hare"
        case .Kanin:      return "Kanin"
            
        case .Hund:       return "Hund"
        case .Räv:        return "Räv"
        case .Varg:       return "Varg"
            
        case .Katt:       return "Katt"
        case .Lodjur:     return "Lodjur"
            
        case .Grävling:   return "Grävling"
        case .Järv:       return "Järv"
        case .Mård:       return "Mård"
        case .Vessla:     return "Vessla"
            
        case .Groda:      return "Groda"
        case .Padda:      return "Padda"
        case .Sköldpadda: return "Sköldpadda"
        case .Ödla:       return "Ödla"
        }
    }
    
    func animalType() -> AnimalType {
        switch self {
        case .Gorilla, .Orangutang, .Schimpans:  return .Apa
        case .Brunbjörn, .Tvättbjörn:            return .Björn
        case .Hamster, .Mus, .Råtta, .Sork:      return .Gnagare
        case .Hare, .Kanin:                      return .Hardjur
        case .Hund, .Räv, .Varg:                 return .Hunddjur
        case .Katt, .Lodjur:                     return .Kattdjur
        case .Grävling, .Järv, .Mård, .Vessla:   return .Mårddjur
        case .Groda, .Padda, .Sköldpadda, .Ödla: return .Reptil
        }
    }
}
