import Foundation

enum Role {
    case healer
    case hunter
    case scavenger
    case seer
    case warrior
    
    static let allValues = [healer, hunter, scavenger, seer, warrior]
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .healer:    return "Helare"
        case .hunter:    return "Jägare"
        case .scavenger: return "Samlare"
        case .seer:      return "Nåjd"
        case .warrior:   return "Krigare"
        }
    }
    
    var definiteFormString: String {
        switch self {
        case .healer:    return "Helaren"
        case .hunter:    return "Jägaren"
        case .scavenger: return "Samlaren"
        case .seer:      return "Nåjden"
        case .warrior:   return "Krigaren"
        }
    }
    
    var description: String {
        switch self {
        case .healer:
            return "Livet efter undergången är fullt av smärta och lidande. Ditt kall är att lindra plågorna, att ge de brutna chansen att resa sig och kämpa en dag till. Det betyder inte att du själv räds hetluften - tvärtom måste du ofta riskera ditt eget liv för att rädda andras. Du är en helare."
        case .hunter:
            return "Naturen är ditt hem. Skogarna och myrarna, vidderna och sjöarna - där du kan få frid sinnet och slippa andras tjatter. De säger att naturen är farlig, att den är ond. Och visst, du har sett bestarna som strövar där ute. Ingen har sett fasorna på närmare håll än du. Men du kan konsten att röra dig osedd och ohörd - och att döda effektivt, när så behövs. När du släpar hem villebrådet till flocken är det ingen som klagar. Du är en jägare."
        case .scavenger:
            return "Skräp? Vilket skräp? Vart du än går, släpar du din kärra eller ryggsäck med dig, fullpackad med prylar. Det är din samling av skatter från människans värld. De andra djuren i klanen fnissar och viskar om dig, men det rör dig inte i ryggen. En dag kommer de att hamna i trubbel - kanske har du då just den sak som kan rädda dem. Du är en samlare."
        case .seer:
            return "Vindens sus genom gräset, insekternas surr, forsens dån i fjärran. För dig har naturens alla ljud en röst, ett budskap om vad som har hänt - eller vad som kommer att ske. Bara du lyssnar tillräckligt noga. Om förmågan är naturlig eller en följd av Betraktarnas experiment bryr du dig inte om. Att skåda in i framtiden har sina fördelar, och andra klanmedlemmar ser på sådana som dig med vördnad och respekt. Du är en nåjd."
        case .warrior:
            return "Krigstrummorna som slår i gryningen är din puls. Du fruktar striden, men du åtrår den på samma gång. Striden är ditt liv. Din uppgift är att skydda flocken mot fiender av alla slag, och det är en uppgift du tar på allra största allvar - men sanningen är att det är striden i sig som du lever för. När striden är över vårdar du dina vapen och gör dig redo för nästa sammandrabbning. Du är en krigare."
        }
    }
    
    var keyAttribute: Attribute {
        switch self {
        case .healer:    return .instinct
        case .hunter:    return .agility
        case .scavenger: return .wits
        case .seer:      return .instinct
        case .warrior:   return .strength
        }
    }
    
    var specialistSkill: Skill {
        switch self {
        case .healer:    return .bryggaDekokt
        case .hunter:    return .jaga
        case .scavenger: return .samla
        case .seer:      return .sia
        case .warrior:   return .skärskåda
        }
    }
    
    var talents: [Talent] {
        switch self {
        case .healer:    return [.kirurg, .själavårdare, .spritkokare]
        case .hunter:    return [.bågmakare, .pälsjägare, .snärjare]
        case .scavenger: return [.gömsle, .packråtta, .vapensamlare]
        case .seer:      return [.dödsvisioner, .plötsligaSyner, .totemmakare]
        case .warrior:   return [.mångkamp, .vapenmakare, .vapenmästare]
        }
    }
    
    var faceOptions: [String] {
        switch self {
        case .healer:
            return ["Vänlig blick", "Frånvarande blick", "Tårögd blick", "Ärrat ansikte", "Stetoskop runt halsen"]
        case .hunter:
            return ["Vakande blick", "Frånvarande blick", "Väderbitet ansikte", "Ärrat ansikte", "Troféer runt halsen"]
        case .scavenger:
            return ["Sökande blick", "Flackande blick", "Nervöst sniffande", "Skrot i halskedja", "Kastrull på huvudet"]
        case .seer:
            return ["Galen blick", "Oseende blick", "Tomtemask", "Amuletter runt halsen", "Rituella ansiktsmålningar"]
        case .warrior:
            return ["Vakande blick", "Intensiv blick", "Död blick", "Ärrat ansikte", "Krigsmålning"]
        }
    }
    
    var bodyOptions: [String] {
        switch self {
        case .healer:
            return ["Krum hållning", "Spenslig", "Fet", "Kortväxt", "Halt"]
        case .hunter:
            return ["Hukande", "Knotig", "Mager", "Smidig", "Kortväxt"]
        case .scavenger:
            return ["Knotig", "Kortväxt", "Senig", "Krum", "Kraftig"]
        case .seer:
            return ["Krum", "Gänglig", "Spenslig", "Knotig", "Fet"]
        case .warrior:
            return ["Kraftfull", "Smidig", "Muskulös", "Storväxt", "Knotig"]
        }
    }
    
    var wearOptions: [String] {
        switch self {
        case .healer:
            return ["Sliten läkarrock", "Overall", "Bandagerad kroppsdel", "Pannspegel", "Läkarväska"]
        case .hunter:
            return ["Sliten täckjacka", "Regnrock med huva", "Kamouflagekläder", "Skidmössa", "Ryggsäck"]
        case .scavenger:
            return ["Regnrock med huva", "Lusekofta", "Sliten täckjacka", "T-shirt med tryck", "Militärkeps"]
        case .seer:
            return ["Trasig frack", "Färgstark regnrock", "Clowndräkt", "Skrot och krimskrams", "Blommigt duschdraperi"]
        case .warrior:
            return ["Kamouflagekläder", "Vapenrock", "Kaptensmössa", "Hockeyskydd", "Hockeymask"]
        }
    }
    
    var rankBonus: Int {
        switch self {
        case .healer:    return 1
        case .hunter:    return 0
        case .scavenger: return -1
        case .seer:      return 3
        case .warrior:   return 2
        }
    }
}
