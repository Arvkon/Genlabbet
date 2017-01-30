import Foundation

enum Talent {
    // Role-specific
    case bågmakare
    case dödsvisioner
    case gömsle
    case kirurg
    case mångkamp
    case packråtta
    case plötsligaSyner
    case pälsjägare
    case själavårdare
    case snärjare
    case spritkokare
    case totemmakare
    case vapenmakare
    case vapenmästare
    case vapensamlare
    
    // General
    case defensiv
    case envis
    case kastarm
    case monsterviskare
    case naturlig
    case nioLiv
    case skarprättare
    case slugger
    case snabbskytt
    case tröstätare
    case vandrare
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .bågmakare:          return "Bågmakare"
            case .dödsvisioner:   return "Dödsvisioner"
            case .gömsle:         return "Gömsle"
            case .kirurg:         return "Kirurg"
            case .mångkamp:       return "Mångkamp"
            case .packråtta:      return "Packråtta"
            case .plötsligaSyner: return "Plötsliga syner"
            case .pälsjägare:     return "Pälsjägare"
            case .själavårdare:   return "Själavårdare"
            case .snärjare:       return "Snärjare"
            case .spritkokare:    return "Spritkokare"
            case .totemmakare:    return "Totemmakare"
            case .vapenmakare:    return "Vapenmakare"
            case .vapenmästare:   return "Vapenmästare"
            case .vapensamlare:   return "Vapensamlare"
            
            case .defensiv:       return "Defensiv"
            case .envis:          return "Envis"
            case .kastarm:        return "Kastarm"
            case .monsterviskare: return "Monsterviskare"
            case .naturlig:       return "Naturlig"
            case .nioLiv:         return "Nio liv"
            case .skarprättare:   return "Skarprättare"
            case .slugger:        return "Slugger"
            case .snabbskytt:     return "Snabbskytt"
            case .tröstätare:     return "Tröstätare"
            case .vandrare:       return "Vandrare"
        }
    }
    
    var description: String {
        switch self {
            
        case .bågmakare:
            return "Du kan tillverka enkla avståndsvapen som slungor och pilbågar. Det kräver tillgång till råmaterial som skrot eller trä, några timmars arbete, och ett lyckat slag för Jaga."
        case .dödsvisioner:
            return "Du har en mörk själ och ser andras död innan den inträffar. Du kan använda sia på ett annorlunda sätt - i stället för att spå om en handlings utgång kan du förutse att en valfri SLP kommer att dö under det pågående spelmötet. Om ditt slag lyckas ska SL besanna din spådom, om det överhuvudtaget är rimligt. Du kan använda denna förmåga till att ta död på dina fiender, men naturen har en tendens att återställa balansen - risken är stor att någon annan olycka drabbar dig eller någon du bryr dig om i stället."
        case .gömsle:
            return "Du bär inte runt på alla dina prylar, utan har även ett hemligt gömställe med mer grejer. Du måste bestämma var det är och låta SL veta detta. Om du går till ditt gömsle får du modifikation +2 till ett slag för att samla. "
        case .kirurg:
            return "Du kan konsten att stoppa blödningar och behandla svåra skador. Du får modifikation +2 när vårdar någon som är bruten av skada eller är på väg att dö av en kritisk skada. Talangen har ingen effekt mot andra typer av trauma."
        case .mångkamp:
            return "Du har lärt dig konsten att försvara dig mot flera fiender samtidigt, att positionera dig så att de inte kan utnyttja sitt numerära överläge. Du får parera anfall i närkamp hur många gånger som helst i samma runda. Du mister dock din egen handling i rundan."
        case .packråtta:
            return "Du är finurlig och bra på att packa smart för att dina prylar ska ta så lite plats som möjligt och din packning bli smidig att bära med sig. Du får basera din bärförmåga på Skärpa istället för Styrka."
        case .plötsligaSyner:
            return "Du behöver inte långa ritualer för att spå om vad som komma ska - syner av framtiden kan drabba dig närsomhelst. Du kan Sia när du vill under spelmötet."
        case .pälsjägare:
            return "När du har dödat ett monster med päls kan du, om du har en kniv, utvinna ett antal pälsar ur kadavret lika med halva monstrets STY (avrunda uppåt)."
        case .själavårdare:
            return "Du läser andra som en öppen bok, och har en naturlig fallenhet för att få dem att öppna sina hjärtan för dig. Du får modifikation +2 när du vårdar någon som är bruten av stress, förvirring eller tvivel - men inte av skada."
        case .snärjare:
            return "Du är kunnig i konsten att gillra fällor och snaror. Slå ett slag för att Jaga för att montera fällan, och välj om den ska vara skadande eller snärjande. Att gillra en fälla tar några minuter. Den som passerar fällan måste lyckas Fly för att inte utlösa den."
        case .spritkokare:
            return "Du kan konsten att destillera fram potent sprit av växter. Några timmars arbete och ett lyckat slag för Brygga dekokt ger T6 doser sprit. Spriten kan drickas eller användas som bränsle."
        case .totemmakare:
            return "Du kan tillverka amuletter, talismaner och ikoner som kan hjälpa dig att fokusera när du Siar. Att tillverka en totem tar några timmar och kräver något råmaterial och ett lyckat slag för att Sia."
        case .vapenmakare:
            return "Du kan tillverka enkla närstridsvapen som knivar, spjut och klubbor. Det kräver tillgång till råmaterial som skrot eller trä, några timmars arbete, och ett lyckat slag för Skärskåda."
        case .vapenmästare:
            return "Du övar i timmar med ditt vapen varje dag, du vet exakt hur du ska använda det för att göra maximal skada. Välj en vapentyp ur listan över närstridsvapen. Du får välja obeväpnad strid (klor och huggtänder). När du använder detta vapen räknas vapenskadan som ett steg högre än normalt."
        case .vapensamlare:
            return "Du är fascinerad av vapen och samlar på dig alla tillhyggen du kan hitta. Du får modifikation +2 när du använder Samla till att hitta ett vapen av något slag i din prylsamling."
            
            
        case .defensiv:
            return "Du är snabb på fötterna och kan enkelt glida undan angrepp i närstrid. Du får modifikation +2 när du använder Slåss för att parera."
        case .envis:
            return "Du vägrar ge dig, kosta vad det kosta vill. Du kan pressa ett tärningsslag två gånger."
        case .kastarm:
            return "Du har lärt dig att använda din armkraft med stor precision när du använder kastvapen som stenar, knivar och spjut. Du får slå för STY i stället för KYL när du kastar dessa vapen. Gäller även handgranater och molotovcoctails."
        case .monsterviskare:
            return "Du kan med hjälp av morranden, grymtanden och gester Dominera vilda djur och monster. Det fungerar inte på insekter eller svärmar och inte heller på Betraktare och andra maskinvarelser."
        case .naturlig:
            return "Du tycker att kläder tynger dig och gör dig osmidig. När du går helt utan kläder - och inte bär mer prylar än halva din normala bärförmåga - får du modifikation +2 på att Smyga och att Fly."
        case .nioLiv:
            return "Hur illa det än ser ut tycks du alltid komma undan med blotta förskräckelsen. När du tar en kritisk skada får du vända på tärningarna, så att ental blir tiotal och tvärtom."
        case .skarprättare:
            return "Du vet var du ska slå för att fienden ska falla och inte resa sig. Någonsin mer. När din fiende får en kritisk skada får du - om du vill - vända på tärningarna, så att så att ental blir tiotal och tvärtom."
        case .slugger:
            return "Du är en slagskämpe som fortsätter slå lika hårt hur mycket stryk du än tar. Du får alltid slå för ditt fulla STY-värde när du slåss, även när din STY är sänkt på grund av skada."
        case .snabbskytt:
            return "Du har lärt dig hantera din slunga eller pilbåge med enastående hastighet. Du kan avlossa dessa vapentyper utan att lägga en manöver på att förbereda vapnet."
        case .tröstätare:
            return "Du finner tröst i att äta. När du äter mat (och vilar några timmar) återhämtar du en poäng Styrka och en poäng Instinkt/Känsla för varje ranson du konsumerar."
        case .vandrare:
            return "Dina fötter (eller tassar) och ben är härdade efter många och långa vandringar. Du får modifikation +2 på att Kämpa på när du slår för att uthärda hård fotvandring."
        }
    }
}
