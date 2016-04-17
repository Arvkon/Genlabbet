import Foundation

enum Role {
    case Helare
    case Jägare
    case Krigare
    case Nåjd
    case Samlare
    
    static let allValues = [Helare, Jägare, Krigare, Nåjd, Samlare]
    
    // MARK: Methods
    
    func string() -> String {
        switch self {
        case .Helare:  return "Helare"
        case .Jägare:  return "Jägare"
        case .Krigare: return "Krigare"
        case .Nåjd:    return "Nåjd"
        case .Samlare: return "Samlare"
        }
    }
    
    func description() -> String {
        switch self {
        case .Helare:
            return "Livet efter undergången är fullt av smärta och lidande. Ditt kall är att lindra plågorna, att ge de brutna chansen att resa sig och kämpa en dag till. Det betyder inte att du själv räds hetluften - tvärtom måste du ofta riskera ditt eget liv för att rädda andras. Du är en helare."
        case .Jägare:
            return "Naturen är ditt hem. Skogarna och myrarna, vidderna och sjöarna - där du kan få frid sinnet och slippa andras tjatter. De säger att naturen är farlig, att den är ond. Och visst, du har sett bestarna som strövar där ute. Ingen har sett fasorna på närmare håll än du. Men du kan konsten att röra dig osedd och ohörd - och att döda effektivt, när så behövs. När du släpar hem villebrådet till flocken är det ingen som klagar. Du är en jägare."
        case .Krigare:
            return "Krigstrummorna som slår i gryningen är din puls. Du fruktar striden, men du åtrår den på samma gång. Striden är ditt liv. Din uppgift är att skydda flocken mot fiender av alla slag, och det är en uppgift du tar på allra största allvar - men sanningen är att det är striden i sig som du lever för. När striden är över vårdar du dina vapen och gör dig redo för nästa sammandrabbning. Du är en krigare."
        case .Nåjd:
            return "Vindens sus genom gräset, insekternas surr, forsens dån i fjärran. För dig har naturens alla ljud en röst, ett budskap om vad som har hänt - eller vad som kommer att ske. Bara du lyssnar tillräckligt noga. Om förmågan är naturlig eller en följd av Betraktarnas experiment bryr du dig inte om. Att skåda in i framtiden har sina fördelar, och andra klanmedlemmar ser på sådana som dig med vördnad och respekt. Du är en nåjd."
        case .Samlare:
            return "Skräp? Vilket skräp? Vart du än går, släpar du din kärra eller ryggsäck med dig, fullpackad med prylar. Det är din samling av skatter från människans värld. De andra djuren i klanen fnissar och viskar om dig, men det rör dig inte i ryggen. En dag kommer de att hamna i trubbel - kanske har du då just den sak som kan rädda dem. Du är en samlare."
        }
    }
    
    func keyAttribute() -> Attribute {
        switch self {
        case .Helare:  return .Instinct
        case .Jägare:  return .Agility
        case .Krigare: return .Strength
        case .Nåjd:    return .Instinct
        case .Samlare: return .Wits
        }
    }
    
    func specialistSkill() -> Skill {
        switch self {
        case .Helare:  return .BryggaDekokt
        case .Jägare:  return .Jaga
        case .Krigare: return .Skärskåda
        case .Nåjd:    return .Sia
        case .Samlare: return .Samla
        }
    }
    
    func talents() -> [Talent] {
        switch self {
        case .Helare:  return [.Kirurg, .Själavårdare, .Spritkokare]
        case .Jägare:  return [.Bågmakare, .Pälsjägare, .Snärjare]
        case .Krigare: return [.Mångkamp, .Vapenmakare, .Vapenmästare]
        case .Nåjd:    return [.Dödsvisioner, .PlötsligaSyner, .Totemmakare]
        case .Samlare: return [.Gömsle, .Packråtta, .Vapensamlare]
        }
    }
    
    func faceOptions() -> [String] {
        switch self {
        case .Helare:
            return ["Vänlig blick", "Frånvarande blick", "Tårögd blick", "Ärrat ansikte", "Stetoskop runt halsen"]
        case .Jägare:
            return ["Vakande blick", "Frånvarande blick", "Väderbitet ansikte", "Ärrat ansikte", "Troféer runt halsen"]
        case .Krigare:
            return ["Vakande blick", "Intensiv blick", "Död blick", "Ärrat ansikte", "Krigsmålning"]
        case .Nåjd:
            return ["Galen blick", "Oseende blick", "Tomtemask", "Amuletter runt halsen", "Rituella ansiktsmålningar"]
        case .Samlare:
            return ["Sökande blick", "Flackande blick", "Nervöst sniffande", "Skrot i halskedja", "Kastrull på huvudet"]
        }
    }
    
    func bodyOptions() -> [String] {
        switch self {
        case .Helare:
            return ["Krum hållning", "Spenslig", "Fet", "Kortväxt", "Halt"]
        case .Jägare:
            return ["Hukande", "Knotig", "Mager", "Smidig", "Kortväxt"]
        case .Krigare:
            return ["Kraftfull", "Smidig", "Muskulös", "Storväxt", "Knotig"]
        case .Nåjd:
            return ["Krum", "Gänglig", "Spenslig", "Knotig", "Fet"]
        case .Samlare:
            return ["Knotig", "Kortväxt", "Senig", "Krum", "Kraftig"]
        }
    }
    
    func wearOptions() -> [String] {
        switch self {
        case .Helare:
            return ["Sliten läkarrock", "Overall", "Bandagerad kroppsdel", "Pannspegel", "Läkarväska"]
        case .Jägare:
            return ["Sliten täckjacka", "Regnrock med huva", "Kamouflagekläder", "Skidmössa", "Ryggsäck"]
        case .Krigare:
            return ["Kamouflagekläder", "Vapenrock", "Kaptensmössa", "Hockeyskydd", "Hockeymask"]
        case .Nåjd:
            return ["Trasig frack", "Färgstark regnrock", "Clowndräkt", "Skrot och krimskrams", "Blommigt duschdraperi"]
        case .Samlare:
            return ["Regnrock med huva", "Lusekofta", "Sliten täckjacka", "T-shirt med tryck", "Militärkeps"]
        }
    }
}
