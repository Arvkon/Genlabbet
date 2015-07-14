import Foundation

enum Talent {
    // Role-specific
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
    
    // MARK: Methods
    
    func string() -> String {
        switch self {
        case .Bågmakare:          return "Bågmakare"
            case .Dödsvisioner:   return "Dödsvisioner"
            case .Gömsle:         return "Gömsle"
            case .Kirurg:         return "Kirurg"
            case .Mångkamp:       return "Mångkamp"
            case .Packråtta:      return "Packråtta"
            case .PlötsligaSyner: return "Plötsliga syner"
            case .Pälsjägare:     return "Pälsjägare"
            case .Själavårdare:   return "Själavårdare"
            case .Snärjare:       return "Snärjare"
            case .Spritkokare:    return "Spritkokare"
            case .Totemmakare:    return "Totemmakare"
            case .Vapenmakare:    return "Vapenmakare"
            case .Vapenmästare:   return "Vapenmästare"
            case .Vapensamlare:   return "Vapensamlare"
            
            case .Defensiv:       return "Defensiv"
            case .Envis:          return "Envis"
            case .Kastarm:        return "Kastarm"
            case .Monsterviskare: return "Monsterviskare"
            case .Naturlig:       return "Naturlig"
            case .NioLiv:         return "Nio liv"
            case .Skarprättare:   return "Skarprättare"
            case .Slugger:        return "Slugger"
            case .Snabbskytt:     return "Snabbskytt"
            case .Tröstätare:     return "Tröstätare"
            case .Vandrare:       return "Vandrare"
        }
    }
    
    func description() -> String {
        switch self {
            
        case .Bågmakare:
            return "Du kan tillverka enkla avståndsvapen som slungor och pilbågar. Det kräver tillgång till råmaterial som skrot eller trä, några timmars arbete, och ett lyckat slag för Jaga."
        case .Dödsvisioner:
            return "Du har en mörk själ och ser andras död innan den inträffar. Du kan använda sia på ett annorlunda sätt - i stället för att spå om en handlings utgång kan du förutse att en valfri SLP kommer att dö under det pågående spelmötet. Om ditt slag lyckas ska SL besanna din spådom, om det överhuvudtaget är rimligt. Du kan använda denna förmåga till att ta död på dina fiender, men naturen har en tendens att återställa balansen - risken är stor att någon annan olycka drabbar dig eller någon du bryr dig om i stället."
        case .Gömsle:
            return "Du bär inte runt på alla dina prylar, utan har även ett hemligt gömställe med mer grejer. Du måste bestämma var det är och låta SL veta detta. Om du går till ditt gömsle får du modifikation +2 till ett slag för att samla. "
        case .Kirurg:
            return "Du kan konsten att stoppa blödningar och behandla svåra skador. Du får modifikation +2 när vårdar någon som är bruten av skada eller är på väg att dö av en kritisk skada. Talangen har ingen effekt mot andra typer av trauma."
        case .Mångkamp:
            return "Du har lärt dig konsten att försvara dig mot flera fiender samtidigt, att positionera dig så att de inte kan utnyttja sitt numerära överläge. Du får parera anfall i närkamp hur många gånger som helst i samma runda. Du mister dock din egen handling i rundan."
        case .Packråtta:
            return "Du är finurlig och bra på att packa smart för att dina prylar ska ta så lite plats som möjligt och din packning bli smidig att bära med sig. Du får basera din bärförmåga på Skärpa istället för Styrka."
        case .PlötsligaSyner:
            return "Du behöver inte långa ritualer för att spå om vad som komma ska - syner av framtiden kan drabba dig närsomhelst. Du kan Sia när du vill under spelmötet."
        case .Pälsjägare:
            return "När du har dödat ett monster med päls kan du, om du har en kniv, utvinna ett antal pälsar ur kadavret lika med halva monstrets STY (avrunda uppåt)."
        case .Själavårdare:
            return "Du läser andra som en öppen bok, och har en naturlig fallenhet för att få dem att öppna sina hjärtan för dig. Du får modifikation +2 när du vårdar någon som är bruten av stress, förvirring eller tvivel - men inte av skada."
        case .Snärjare:
            return "Du är kunnig i konsten att gillra fällor och snaror. Slå ett slag för att Jaga för att montera fällan, och välj om den ska vara skadande eller snärjande. Att gillra en fälla tar några minuter. Den som passerar fällan måste lyckas Fly för att inte utlösa den."
        case .Spritkokare:
            return "Du kan konsten att destillera fram potent sprit av växter. Några timmars arbete och ett lyckat slag för Brygga dekokt ger T6 doser sprit. Spriten kan drickas eller användas som bränsle."
        case .Totemmakare:
            return "Du kan tillverka amuletter, talismaner och ikoner som kan hjälpa dig att fokusera när du Siar. Att tillverka en totem tar några timmar och kräver något råmaterial och ett lyckat slag för att Sia."
        case .Vapenmakare:
            return "Du kan tillverka enkla närstridsvapen som knivar, spjut och klubbor. Det kräver tillgång till råmaterial som skrot eller trä, några timmars arbete, och ett lyckat slag för Skärskåda."
        case .Vapenmästare:
            return "Du övar i timmar med ditt vapen varje dag, du vet exakt hur du ska använda det för att göra maximal skada. Välj en vapentyp ur listan över närstridsvapen. Du får välja obeväpnad strid (klor och huggtänder). När du använder detta vapen räknas vapenskadan som ett steg högre än normalt."
        case .Vapensamlare:
            return "Du är fascinerad av vapen och samlar på dig alla tillhyggen du kan hitta. Du får modifikation +2 när du använder Samla till att hitta ett vapen av något slag i din prylsamling."
            
            
        case .Defensiv:
            return "Du är snabb på fötterna och kan enkelt glida undan angrepp i närstrid. Du får modifikation +2 när du använder Slåss för att parera."
        case .Envis:
            return "Du vägrar ge dig, kosta vad det kosta vill. Du kan pressa ett tärningsslag två gånger."
        case .Kastarm:
            return "Du har lärt dig att använda din armkraft med stor precision när du använder kastvapen som stenar, knivar och spjut. Du får slå för STY i stället för KYL när du kastar dessa vapen. Gäller även handgranater och molotovcoctails."
        case .Monsterviskare:
            return "Du kan med hjälp av morranden, grymtanden och gester Dominera vilda djur och monster. Det fungerar inte på insekter eller svärmar och inte heller på Betraktare och andra maskinvarelser."
        case .Naturlig:
            return "Du tycker att kläder tynger dig och gör dig osmidig. När du går helt utan kläder - och inte bär mer prylar än halva din normala bärförmåga - får du modifikation +2 på att Smyga och att Fly."
        case .NioLiv:
            return "Hur illa det än ser ut tycks du alltid komma undan med blotta förskräckelsen. När du tar en kritisk skada får du vända på tärningarna, så att ental blir tiotal och tvärtom."
        case .Skarprättare:
            return "Du vet var du ska slå för att fienden ska falla och inte resa sig. Någonsin mer. När din fiende får en kritisk skada får du - om du vill - vända på tärningarna, så att så att ental blir tiotal och tvärtom."
        case .Slugger:
            return "Du är en slagskämpe som fortsätter slå lika hårt hur mycket stryk du än tar. Du får alltid slå för ditt fulla STY-värde när du slåss, även när din STY är sänkt på grund av skada."
        case .Snabbskytt:
            return "Du har lärt dig hantera din slunga eller pilbåge med enastående hastighet. Du kan avlossa dessa vapentyper utan att lägga en manöver på att förbereda vapnet."
        case .Tröstätare:
            return "Du finner tröst i att äta. När du äter mat (och vilar några timmar) återhämtar du en poäng Styrka och en poäng Instinkt/Känsla för varje ranson du konsumerar."
        case .Vandrare:
            return "Dina fötter (eller tassar) och ben är härdade efter många och långa vandringar. Du får modifikation +2 på att Kämpa på när du slår för att uthärda hård fotvandring."
        }
    }
}
