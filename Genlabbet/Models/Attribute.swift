import Foundation

enum Attribute {
    case agility
    case instinct
    case strength
    case wits
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .agility:  return "Kyla"
        case .instinct: return "Instinkt"
        case .strength: return "Styrka"
        case .wits:     return "Skärpa"
        }
    }
    
    var abbreviation: String {
        switch self {
        case .agility:  return "KYL"
        case .instinct: return "INS"
        case .strength: return "STY"
        case .wits:     return "SKP"
        }
    }
    
    var stringWithAbbreviation: String {
        return string + " (" + abbreviation + ")"
    }
    
    var description: String {
        switch self {
        case .agility:
            return "Kroppskontroll, mentalt fokus och finmotorik. Avgör hur mycket stress du tål. Återhämtas med vatten."
        case .instinct:
            return "Djurisk närvaro och ordlös kommunikation. Avgör hur mycket tvivel du tål. Återhämtas med ett djurbeteende som beror på din djurtyp."
        case .strength:
            return "Rå muskelkraft och storlek. Avgör hur mycket skada du tål. Återhämtas med mat."
        case .wits:
            return "Sinnesskärpa, vaksamhet och intelligens. Avgör hur mycket förvirring du tål. Återhämtas med sömn."
        }
    }
}
