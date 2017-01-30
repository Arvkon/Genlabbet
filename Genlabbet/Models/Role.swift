import Foundation

enum Role {
    case helare
    case jägare
    case krigare
    case nåjd
    case samlare
    
    static let allValues = [helare, jägare, krigare, nåjd, samlare]
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .helare:  return "Helare"
        case .jägare:  return "Jägare"
        case .krigare: return "Krigare"
        case .nåjd:    return "Nåjd"
        case .samlare: return "Samlare"
        }
    }
    
    var definiteFormString: String {
        switch self {
        case .helare:  return "Helaren"
        case .jägare:  return "Jägaren"
        case .krigare: return "Krigaren"
        case .nåjd:    return "Nåjden"
        case .samlare: return "Samlaren"
        }
    }
    
    var description: String {
        switch self {
        case .helare:
            return "Livet efter undergången är fullt av smärta och lidande. Ditt kall är att lindra plågorna, att ge de brutna chansen att resa sig och kämpa en dag till. Det betyder inte att du själv räds hetluften - tvärtom måste du ofta riskera ditt eget liv för att rädda andras. Du är en helare."
        case .jägare:
            return "Naturen är ditt hem. Skogarna och myrarna, vidderna och sjöarna - där du kan få frid sinnet och slippa andras tjatter. De säger att naturen är farlig, att den är ond. Och visst, du har sett bestarna som strövar där ute. Ingen har sett fasorna på närmare håll än du. Men du kan konsten att röra dig osedd och ohörd - och att döda effektivt, när så behövs. När du släpar hem villebrådet till flocken är det ingen som klagar. Du är en jägare."
        case .krigare:
            return "Krigstrummorna som slår i gryningen är din puls. Du fruktar striden, men du åtrår den på samma gång. Striden är ditt liv. Din uppgift är att skydda flocken mot fiender av alla slag, och det är en uppgift du tar på allra största allvar - men sanningen är att det är striden i sig som du lever för. När striden är över vårdar du dina vapen och gör dig redo för nästa sammandrabbning. Du är en krigare."
        case .nåjd:
            return "Vindens sus genom gräset, insekternas surr, forsens dån i fjärran. För dig har naturens alla ljud en röst, ett budskap om vad som har hänt - eller vad som kommer att ske. Bara du lyssnar tillräckligt noga. Om förmågan är naturlig eller en följd av Betraktarnas experiment bryr du dig inte om. Att skåda in i framtiden har sina fördelar, och andra klanmedlemmar ser på sådana som dig med vördnad och respekt. Du är en nåjd."
        case .samlare:
            return "Skräp? Vilket skräp? Vart du än går, släpar du din kärra eller ryggsäck med dig, fullpackad med prylar. Det är din samling av skatter från människans värld. De andra djuren i klanen fnissar och viskar om dig, men det rör dig inte i ryggen. En dag kommer de att hamna i trubbel - kanske har du då just den sak som kan rädda dem. Du är en samlare."
        }
    }
    
    var keyAttribute: Attribute {
        switch self {
        case .helare:  return .instinct
        case .jägare:  return .agility
        case .krigare: return .strength
        case .nåjd:    return .instinct
        case .samlare: return .wits
        }
    }
    
    var specialistSkill: Skill {
        switch self {
        case .helare:  return .bryggaDekokt
        case .jägare:  return .jaga
        case .krigare: return .skärskåda
        case .nåjd:    return .sia
        case .samlare: return .samla
        }
    }
    
    var talents: [Talent] {
        switch self {
        case .helare:  return [.kirurg, .själavårdare, .spritkokare]
        case .jägare:  return [.bågmakare, .pälsjägare, .snärjare]
        case .krigare: return [.mångkamp, .vapenmakare, .vapenmästare]
        case .nåjd:    return [.dödsvisioner, .plötsligaSyner, .totemmakare]
        case .samlare: return [.gömsle, .packråtta, .vapensamlare]
        }
    }
    
    var faceOptions: [String] {
        switch self {
        case .helare:
            return ["Vänlig blick", "Frånvarande blick", "Tårögd blick", "Ärrat ansikte", "Stetoskop runt halsen"]
        case .jägare:
            return ["Vakande blick", "Frånvarande blick", "Väderbitet ansikte", "Ärrat ansikte", "Troféer runt halsen"]
        case .krigare:
            return ["Vakande blick", "Intensiv blick", "Död blick", "Ärrat ansikte", "Krigsmålning"]
        case .nåjd:
            return ["Galen blick", "Oseende blick", "Tomtemask", "Amuletter runt halsen", "Rituella ansiktsmålningar"]
        case .samlare:
            return ["Sökande blick", "Flackande blick", "Nervöst sniffande", "Skrot i halskedja", "Kastrull på huvudet"]
        }
    }
    
    var bodyOptions: [String] {
        switch self {
        case .helare:
            return ["Krum hållning", "Spenslig", "Fet", "Kortväxt", "Halt"]
        case .jägare:
            return ["Hukande", "Knotig", "Mager", "Smidig", "Kortväxt"]
        case .krigare:
            return ["Kraftfull", "Smidig", "Muskulös", "Storväxt", "Knotig"]
        case .nåjd:
            return ["Krum", "Gänglig", "Spenslig", "Knotig", "Fet"]
        case .samlare:
            return ["Knotig", "Kortväxt", "Senig", "Krum", "Kraftig"]
        }
    }
    
    var wearOptions: [String] {
        switch self {
        case .helare:
            return ["Sliten läkarrock", "Overall", "Bandagerad kroppsdel", "Pannspegel", "Läkarväska"]
        case .jägare:
            return ["Sliten täckjacka", "Regnrock med huva", "Kamouflagekläder", "Skidmössa", "Ryggsäck"]
        case .krigare:
            return ["Kamouflagekläder", "Vapenrock", "Kaptensmössa", "Hockeyskydd", "Hockeymask"]
        case .nåjd:
            return ["Trasig frack", "Färgstark regnrock", "Clowndräkt", "Skrot och krimskrams", "Blommigt duschdraperi"]
        case .samlare:
            return ["Regnrock med huva", "Lusekofta", "Sliten täckjacka", "T-shirt med tryck", "Militärkeps"]
        }
    }
    
    var rankBonus: Int {
        switch self {
        case .helare:  return 1
        case .jägare:  return 0
        case .krigare: return 2
        case .nåjd:    return 3
        case .samlare: return -1
        }
    }
}
