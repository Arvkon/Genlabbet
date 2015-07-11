import Foundation

class Character {
    var labbnamn: String?
    var upprorsnamn: String?
    var djurtyp: AnimalType? // TODO: Deduce from Species?
    var art: Species?
    var ålder: Age?
    var rang: Int?
    var kön: Gender?
    
    // Attribute scores
    var styrka: Int?
    var kyla: Int?
    var skärpa: Int?
    var instinkt: Int?
    
    var färdigheter: [Skill: Int]?
    
    // Gear
    var ransonerKrubb: Int?  // Grub
    var ransonerVatten: Int? // Water
}

enum Gender {
    case Hona
    case Hane
}

enum Talent {
    case Bågmakare
    case Dödsvisioner
    case Gömsle
    case Kirurg
    case Mångkamp
    case Packråtta
    case PlötsligaSyner
    case Pälsjägare
    case Själavårdare
    case Snärjare
    case Spritkokare
    case Totemmakare
    case Vapenmakare
    case Vapenmästare
    case Vapensamlare
    
    // General
    case Defensiv
    case Envis
    case Kastarm
    case Monsterviskare
    case Naturlig
    case NioLiv
    case Skarprättare
    case Slugger
    case Snabbskytt
    case Tröstätare
    case Vandrare
}

enum Djurförmåga {
    case Amfibisk
    case Blixtsnabb
    case Flyktsinne
    case Giftbett
    case Grävare
    case Hoppförmåga
    case Jaktsinne
    case Klättrare
    case Liten
    case Ljudlös
    case Lurvig
    case Löpsnabb
    case Nattsyn
    case Pansar
    case Rovattack
    case Stor
    case Svans
    case Varningsrop
    case Växtätare
}

enum Role: String {
    case Helare  = "Helare"
    case Jägare  = "Jägare"
    case Krigare = "Krigare"
    case Nåjd    = "Nåjd"
    case Samlare = "Samlare"
    
    static let allMembers = [Helare, Jägare, Krigare, Nåjd, Samlare]
}

enum Attribute {
    case Strength // Styrka
    case Agility  // Kyla
    case Wits     // Skärpa
    case Instinct // Instinkt
}

enum Skill {
    // Specialist Skills
    case BryggaDekokt
    case Jaga
    case Samla
    case Sia
    case Skärskåda
    
    // General Skills
    case Endure     // Kämpa På
    case Force      // Ta Krafttag
    case Fight      // Slåss
    case Sneak      // Smyga
    case Move       // Fly
    case Shoot      // Skjuta
    case Scout      // Speja
    case KnowNature // Känna Naturen
    case Comprehend // Förstå Sig På
    case Sniffa     //
    case Dominate   // Dominera
    case Heal       // Vårda
}

enum Age: Int {
    case Ungdjur
    case Mogen
    case Äldste
}

enum AnimalType: String {
    case Apa      = "Apa"
    case Björn    = "Björn"
    case Gnagare  = "Gnagare"
    case Hardjur  = "Hardjur"
    case Hunddjur = "Hunddjur"
    case Kattdjur = "Kattdjur"
    case Mårddjur = "Mårddjur"
    case Reptil   = "Reptil"
}

enum Species: String {
    // Apa
    case Gorilla    = "Gorilla"
    case Orangutang = "Orangutang"
    case Schimpans  = "Schimpans"
    
    // Björn
    case Brunbjörn  = "Brunbjörn"
    case Tvättbjörn = "Tvättbjörn"
    
    // Gnagare
    case Hamster    = "Hamster"
    case Mus        = "Mus"
    case Råtta      = "Råtta"
    case Sork       = "Sork"
    
    // Hardjur
    case Hare       = "Hare"
    case Kanin      = "Kanin"
    
    // Hunddjur
    case Hund       = "Hund"
    case Räv        = "Räv"
    case Varg       = "Varg"
    
    // Kattdjur
    case Katt       = "Katt"
    case Lodjur     = "Lodjur"
    
    // Mårddjur
    case Grävling   = "Grävling"
    case Järv       = "Järv"
    case Mård       = "Mård"
    case Vessla     = "Vessla"
    
    // Reptil
    case Groda      = "Groda"
    case Padda      = "Padda"
    case Sköldpadda = "Sköldpadda"
    case Ödla       = "Ödla"
}
