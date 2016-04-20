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
    
    func namingConventionText() -> String {
        let textEnding = " Efter namnet sätts ett tvåsiffrigt tal."
        
        switch self {
        case .Apa:
            return "Apor döps efter kända fysiker." + textEnding
        case .Björn:
            return "Björnar döps efter berömda namn från filmbranschen." + textEnding
        case .Gnagare:
            return "Gnagare döps efter kända kompositörer." + textEnding
        case .Hardjur:
            return "Hardjur döps efter kända fotbollsspelare." + textEnding
        case .Hunddjur:
            return "Hunddjur döps efter astronauter, satelliter och planeter." + textEnding
        case .Kattdjur:
            return "Kattdjur döps efter antikens romare." + textEnding
        case .Mårddjur:
            return "Mårddjur döps efter berömda hockeyspelare och andra vintersportare." + textEnding
        case .Reptil:
            return "Reptiler döps efter klassiska namn i musikbranschen." + textEnding
        }
    }
    
    func exampleNames() -> [String] {
        switch self {
        case .Apa:
            return ["Newton 23", "Curie 88", "Einstein 97", "Bohr 12", "Oppenheimer 51"]
        case .Björn:
            return ["Truffaut 19", "Bogart 76", "Garbo 07", "Bergman 45"]
        case .Gnagare:
            return ["Vivaldi 67", "Mozart 44", "Mendelssohn 33", "Rachmaninov 83"]
        case .Hardjur:
            return ["Ronaldo 90", "Totti 12", "Zlatan 18"]
        case .Hunddjur:
            return ["Gagarin 17", "Laika 09", "Aldrin 53", "Teresjkova 72", "Sputnik 18"]
        case .Kattdjur:
            return ["Cassius 09", "Octavia 15", "Agrippa 37", "Lucilla 12", "Flavia 97"]
        case .Mårddjur:
            return ["Krutov 85", "Salming 50", "Gretzky 15"]
        case .Reptil:
            return ["Piaf 12", "Elvis 48", "Dolly 89", "Pavarotti 15"]
        }
    }
    
    func animalPowers() -> [AnimalPower] {
        switch self {
        case .Apa:
            return [.Hoppförmåga, .Klättrare, .Lurvig, .Löpsnabb, .Stor, .Varningsrop, .Växtätare]
        case .Björn:
            return [.Lurvig, .Löpsnabb, .Rovattack, .Stor, .Växtätare]
        case .Gnagare:
            return [.Flyktsinne, .Grävare, .Klättrare, .Liten, .Ljudlös, .Nattsyn, .SjätteSinne, .Växtätare]
        case .Hardjur:
            return [.Blixtsnabb, .Flyktsinne, .Grävare, .Hoppförmåga, .Liten, .Löpsnabb, .Växtätare]
        case .Hunddjur:
            return [.Jaktsinne, .Lurvig, .Löpsnabb, .Nattsyn, .Rovattack, .Svans, .Varningsrop]
        case .Kattdjur:
            return [.Blixtsnabb, .Jaktsinne, .Klättrare, .Ljudlös, .Löpsnabb, .Nattsyn, .Rovattack, .Svans]
        case .Mårddjur:
            return [.Grävare, .Jaktsinne, .Liten, .Rovattack, .SjätteSinne]
        case .Reptil:
            return [.Amfibisk, .Blixtsnabb, .Giftbett, .Hoppförmåga, .Jaktsinne, .Pansar, .Svans]
        }
    }
}
