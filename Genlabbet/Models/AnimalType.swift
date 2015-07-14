import Foundation

enum AnimalType {
    case Apa
    case Björn
    case Gnagare
    case Hardjur
    case Hunddjur
    case Kattdjur
    case Mårddjur
    case Reptil
    
    // MARK: Methods
    
    func string() -> String {
        switch self {
        case .Apa:      return "Apa"
        case .Björn:    return "Björn"
        case .Gnagare:  return "Gnagare"
        case .Hardjur:  return "Hardjur"
        case .Hunddjur: return "Hunddjur"
        case .Kattdjur: return "Kattdjur"
        case .Mårddjur: return "Mårddjur"
        case .Reptil:   return "Reptil"
        }
    }
}
