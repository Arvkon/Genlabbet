import Foundation

enum AnimalType {
    case ape
    case badger
    case bear
    case cat
    case dog
    //case moose
    case rabbit
    case rat
    case reptile
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .ape:     return "Apa"
        case .badger:  return "Mårddjur"
        case .bear:    return "Björn"
        case .cat:     return "Kattdjur"
        case .dog:     return "Hunddjur"
        case .rabbit:  return "Hardjur"
        case .rat:     return "Gnagare"
        case .reptile: return "Reptil"
        }
    }
    
    var pluralDefiniteFormString: String {
        switch self {
        case .ape:     return "Aporna"
        case .badger:  return "Mårddjuren"
        case .bear:    return "Björnarna"
        case .cat:     return "Kattdjuren"
        case .dog:     return "Hunddjuren"
        case .rabbit:  return "Hardjuren"
        case .rat:     return "Gnagarna"
        case .reptile: return "Reptilerna"
        }
    }
    
    var namingConventionText: String {
        let textEnding = " Efter namnet sätts ett tvåsiffrigt tal."
        
        switch self {
        case .ape:
            return "Apor döps efter kända fysiker." + textEnding
        case .badger:
            return "Mårddjur döps efter berömda hockeyspelare och andra vintersportare." + textEnding
        case .bear:
            return "Björnar döps efter berömda namn från filmbranschen." + textEnding
        case .cat:
            return "Kattdjur döps efter antikens romare." + textEnding
        case .dog:
            return "Hunddjur döps efter astronauter, satelliter och planeter." + textEnding
        case .rabbit:
            return "Hardjur döps efter kända fotbollsspelare." + textEnding
        case .rat:
            return "Gnagare döps efter kända kompositörer." + textEnding
        case .reptile:
            return "Reptiler döps efter klassiska namn i musikbranschen." + textEnding
        }
    }
    
    var exampleNames: [String] {
        switch self {
        case .ape:
            return ["Newton 23", "Curie 88", "Einstein 97", "Bohr 12", "Oppenheimer 51"]
        case .badger:
            return ["Krutov 85", "Salming 50", "Gretzky 15"]
        case .bear:
            return ["Truffaut 19", "Bogart 76", "Garbo 07", "Bergman 45"]
        case .cat:
            return ["Cassius 09", "Octavia 15", "Agrippa 37", "Lucilla 12", "Flavia 97"]
        case .dog:
            return ["Gagarin 17", "Laika 09", "Aldrin 53", "Teresjkova 72", "Sputnik 18"]
        case .rabbit:
            return ["Ronaldo 90", "Totti 12", "Zlatan 18"]
        case .rat:
            return ["Vivaldi 67", "Mozart 44", "Mendelssohn 33", "Rachmaninov 83"]
        case .reptile:
            return ["Piaf 12", "Elvis 48", "Dolly 89", "Pavarotti 15"]
        }
    }
    
    var animalPowers: [AnimalPower] {
        switch self {
        case .ape:
            return [.climber, .fleetFooted, .furry, .herbivore, .huge, .jumper, .warningCall]
        case .badger:
            return [.burrower, .huntingInstincts, .predator, .sixthSense, .small]
        case .bear:
            return [.fleetFooted, .furry, .herbivore, .huge, .predator]
        case .cat:
            return [.climber, .fastReflexes, .fleetFooted, .huntingInstincts, .nocturnal, .predator, .silent, .tail]
        case .dog:
            return [.fleetFooted, .furry, .huntingInstincts, .nocturnal, .predator, .tail, .warningCall]
        case .rabbit:
            return [.burrower, .fastReflexes, .fleetFooted, .flightResponse, .herbivore, .jumper, .small]
        case .rat:
            return [.burrower, .climber, .flightResponse, .herbivore, .nocturnal, .silent, .sixthSense, .small]
        case .reptile:
            return [.amphibian, .fastReflexes, .huntingInstincts, .jumper, .naturalArmor, .poisonousBite, .tail]
        }
    }
}
