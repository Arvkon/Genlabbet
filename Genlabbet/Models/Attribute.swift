import Foundation

enum Attribute {
    case Agility
    case Instinct
    case Strength
    case Wits
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .Agility:  return "Kyla"
        case .Instinct: return "Instinkt"
        case .Strength: return "Styrka"
        case .Wits:     return "Skärpa"
        }
    }
    
    var abbreviation: String {
        switch self {
        case .Agility:  return "KYL"
        case .Instinct: return "INS"
        case .Strength: return "STY"
        case .Wits:     return "SKP"
        }
    }
    
    var stringWithAbbreviation: String {
        return string + " (" + abbreviation + ")"
    }
    
    var description: String {
        switch self {
        case .Agility:
            return "Kroppskontroll, mentalt fokus och finmotorik. Avgör hur mycket stress du tål. Återhämtas med vatten."
        case .Instinct:
            return "Djurisk närvaro och ordlös kommunikation. Avgör hur mycket tvivel du tål. Återhämtas med ett djurbeteende som beror på din djurtyp."
        case .Strength:
            return "Rå muskelkraft och storlek. Avgör hur mycket skada du tål. Återhämtas med mat."
        case .Wits:
            return "Sinnesskärpa, vaksamhet och intelligens. Avgör hur mycket förvirring du tål. Återhämtas med sömn."
        }
    }
}
