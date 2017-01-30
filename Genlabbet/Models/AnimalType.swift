import Foundation

enum AnimalType {
    case apa
    case björn
    case gnagare
    case hardjur
    case hunddjur
    case kattdjur
    case mårddjur
    case reptil
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .apa:      return "Apa"
        case .björn:    return "Björn"
        case .gnagare:  return "Gnagare"
        case .hardjur:  return "Hardjur"
        case .hunddjur: return "Hunddjur"
        case .kattdjur: return "Kattdjur"
        case .mårddjur: return "Mårddjur"
        case .reptil:   return "Reptil"
        }
    }
    
    var pluralDefiniteFormString: String {
        switch self {
        case .apa:      return "Aporna"
        case .björn:    return "Björnarna"
        case .gnagare:  return "Gnagarna"
        case .hardjur:  return "Hardjuren"
        case .hunddjur: return "Hunddjuren"
        case .kattdjur: return "Kattdjuren"
        case .mårddjur: return "Mårddjuren"
        case .reptil:   return "Reptilerna"
        }
    }
    
    var namingConventionText: String {
        let textEnding = " Efter namnet sätts ett tvåsiffrigt tal."
        
        switch self {
        case .apa:
            return "Apor döps efter kända fysiker." + textEnding
        case .björn:
            return "Björnar döps efter berömda namn från filmbranschen." + textEnding
        case .gnagare:
            return "Gnagare döps efter kända kompositörer." + textEnding
        case .hardjur:
            return "Hardjur döps efter kända fotbollsspelare." + textEnding
        case .hunddjur:
            return "Hunddjur döps efter astronauter, satelliter och planeter." + textEnding
        case .kattdjur:
            return "Kattdjur döps efter antikens romare." + textEnding
        case .mårddjur:
            return "Mårddjur döps efter berömda hockeyspelare och andra vintersportare." + textEnding
        case .reptil:
            return "Reptiler döps efter klassiska namn i musikbranschen." + textEnding
        }
    }
    
    var exampleNames: [String] {
        switch self {
        case .apa:
            return ["Newton 23", "Curie 88", "Einstein 97", "Bohr 12", "Oppenheimer 51"]
        case .björn:
            return ["Truffaut 19", "Bogart 76", "Garbo 07", "Bergman 45"]
        case .gnagare:
            return ["Vivaldi 67", "Mozart 44", "Mendelssohn 33", "Rachmaninov 83"]
        case .hardjur:
            return ["Ronaldo 90", "Totti 12", "Zlatan 18"]
        case .hunddjur:
            return ["Gagarin 17", "Laika 09", "Aldrin 53", "Teresjkova 72", "Sputnik 18"]
        case .kattdjur:
            return ["Cassius 09", "Octavia 15", "Agrippa 37", "Lucilla 12", "Flavia 97"]
        case .mårddjur:
            return ["Krutov 85", "Salming 50", "Gretzky 15"]
        case .reptil:
            return ["Piaf 12", "Elvis 48", "Dolly 89", "Pavarotti 15"]
        }
    }
    
    var animalPowers: [AnimalPower] {
        switch self {
        case .apa:
            return [.hoppförmåga, .klättrare, .lurvig, .löpsnabb, .stor, .varningsrop, .växtätare]
        case .björn:
            return [.lurvig, .löpsnabb, .rovattack, .stor, .växtätare]
        case .gnagare:
            return [.flyktsinne, .grävare, .klättrare, .liten, .ljudlös, .nattsyn, .sjätteSinne, .växtätare]
        case .hardjur:
            return [.blixtsnabb, .flyktsinne, .grävare, .hoppförmåga, .liten, .löpsnabb, .växtätare]
        case .hunddjur:
            return [.jaktsinne, .lurvig, .löpsnabb, .nattsyn, .rovattack, .svans, .varningsrop]
        case .kattdjur:
            return [.blixtsnabb, .jaktsinne, .klättrare, .ljudlös, .löpsnabb, .nattsyn, .rovattack, .svans]
        case .mårddjur:
            return [.grävare, .jaktsinne, .liten, .rovattack, .sjätteSinne]
        case .reptil:
            return [.amfibisk, .blixtsnabb, .giftbett, .hoppförmåga, .jaktsinne, .pansar, .svans]
        }
    }
}
