import Foundation

enum Skill: Int {
    // Specialist Skills
    case bryggaDekokt
    case jaga
    case samla
    case sia
    case skärskåda
    
    // General Skills
    case endure
    case force
    case fight
    case sneak
    case move
    case shoot
    case scout
    case comprehend
    case knowNature
    case senseEmotion
    case dominate
    case heal
    
    // MARK: Type Properties
    
    static let allGeneralSkills = [endure, force, fight, sneak, move, shoot, scout, comprehend, knowNature, senseEmotion, dominate, heal]
    static let allValues = [bryggaDekokt, jaga, samla, sia, skärskåda] + allGeneralSkills
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .bryggaDekokt: return "Brygga dekokt"
        case .jaga:         return "Jaga"
        case .samla:        return "Samla"
        case .sia:          return "Sia"
        case .skärskåda:    return "Skärskåda"
            
        case .endure:       return "Kämpa på"
        case .force:        return "Ta krafttag"
        case .fight:        return "Slåss"
        case .sneak:        return "Smyga"
        case .move:         return "Fly"
        case .shoot:        return "Skjuta"
        case .scout:        return "Speja"
        case .comprehend:   return "Förstå sig på"
        case .knowNature:   return "Känna naturen"
        case .senseEmotion: return "Sniffa"
        case .dominate:     return "Dominera"
        case .heal:         return "Vårda"
        }
    }
    
    var description: String {
        switch self {
        case .bryggaDekokt:
            return "I Paradisdalen finns förunderliga växter. För ett otränat öga ser kanske allt ut som ogräs - men du vet vilka växter som helar och vilka som dödar. Du plockar dem, kokar dem och utvinner de aktiva substanserna."
        case .jaga:
            return "Som en av klanens jägare är det din uppgift att spåra och fälla villebråd till föda för dina klanfränder."
        case .samla:
            return "Du plockar på dig alla prylar och allt skrot du kan hitta, och lägger det i en vagn eller ryggsäck som du alltid släpar med dig. Varje gång du behöver en pryl för att utföra en handling, slå för att samla. Om du lyckas har du ett lämpligt redskap - välj själv vad det är."
        case .sia:
            return "Du kan genomföra en spådomsritual för att se vad som kan ske senare under spelmötet. Ritualen tar några timmar, och kan genomföras med hjälp av hallucinogena växter, ett bastutält, musik och dans eller någon annan metod som du själv väljer. Under ritualen får du visioner av framtiden, inre bilder som visar en viss handling, vem som utför den och om den lyckas eller inte. Du väljer själv vad visionen visar."
        case .skärskåda:
            return "En sann krigare vet att striden avgörs innan det första slaget är utdelat. Om du får chansen att studera din fiende under någon minut kan du slå för att skärskåda. Om slaget lyckas måste SL berätta vilken fiendens högsta grundegenskap och färdighet är, och värdena i dessa. Färdigheten kan användas mot såväl djurmutanter och människor som monster och robotar."
            
            
        case .endure:
            return "När vinden eller kölden är hård på fjället, när du måste samla all din styrka för att fortsätta, slår du för att kämpa på. Om du lyckas övervinner du smärtan och utmattningen och kan kämpa vidare ett tag till."
        case .force:
            return "När du måste lyfta ett tungt gammalt fornfynd eller böja Betraktarnas galler slår du för att ta krafttag. Du använder denna färdighet för alla sorters fysiska styrkeprov. Om slaget lyckas klarar du prövningen."
        case .fight:
            return "Livet i Paradisdalen är hårt. Ibland har du inget annat val än att slåss - mot rivaler i klanen, mot djur i andra klaner, och kanske, en dag, mot Betraktarna själva.\nSlå för denna färdighet när du angriper någon i närstrid. Om slaget lyckas träffar din attack och du gör vapenskada på fienden."
        case .sneak:
            return "Ofta är det klokt att undvika strid och i stället smyga förbi fienden. Om ditt tärningsslag lyckas tar du dig fram utan att bli upptäckt.\nDu kan också använda färdigheten till att hålla dig dold och undgå upptäckt även när du är stilla. Ett tredje sätt att använda färdigheten är att utföra en smygattack eller ett bakhåll."
        case .move:
            return "När det osar hett och oddsen är emot dig gäller det att hålla huvudet kallt och röra sig snabbt. Slå för att fly när du vill ta dig ur en konflikt eller annan farlig situation. Om slaget lyckas klarar du dig ur knipan – för den här gången."
        case .shoot:
            return "De flesta djurmutanter föredrar att möta sina fiender i närkamp, med blottade huggtänder och klor. Men vissa har lärt sig Människans förmåga att slåss på avstånd, med pilbågar, slungor och ibland till och med forntida skjutvapen med enorm förstörelsekraft."
        case .scout:
            return "Paradisdalen är full av faror och andra märkliga ting. Betraktarnas maskiner, muterade bestar och dödliga naturfenomen kan ta ditt liv på ett ögonblick om du inte är vaksam. När du vill speja mot en plats, varelse eller objekt på avstånd slår du för denna färdighet. Till skillnad från människor förlitar sig djur inte bara på synen - lukt och hörsel är minst lika viktiga sinnen."
        case .comprehend:
            return "Överallt i Paradisdalen finns Människans lämningar. Skrifter, bilder, märkliga apparater. Och under marken finns den mystiska Labyrinten, fylld av Betraktarnas bisarra manicker. Du slår för att förstå dig på när du vill förstå hur en fornpryl fungerar, läsa en text på människans språk, eller veta vad en gammal ruin har använts till. Om slaget lyckas förstår du vad du ser på, och kan använda föremålet."
        case .knowNature:
            return "Paradisdalens natur är skrämmande och oberäknelig. En vacker äng kan plötsligt förvandlas till en översvämmad sumpmark. En prunkande skog kan på ett ögonblick bli ett brinnande inferno. Och i dalen strövar muterade monster som tycks bli mer och mer bisarra för varje år som går.\nSlå för att känna naturen när du vill veta något om en varelse eller ett fenomen som du stöter på i Paradisdalen."
        case .senseEmotion:
            return "Inget avslöjar lika mycket om en annan varelse som dess lukt. Genom att sniffa på en SLP kan du bedöma hans sinnesstämning, inställning till dig, och mycket annat. Om slaget lyckas måste SL berätta vad SLP:ns starkaste känsla är just nu – till exempel hat, rädsla, förakt eller kärlek."
        case .dominate:
            return "Lögner, smicker och manipulation var Människans sätt att få andra att lyda. Djuren har ett annat sätt att bryta motstridiga viljor - en djurisk mätning av rang och dominans."
        case .heal:
            return "Om inte din flock tog hand om dig skulle du inte att bli långlivad, och du måste i gengäld ställa upp för din flock. Med färdigheten vårda kan du hjälpa vänner som fallit på fötter igen, och till och med rädda deras liv om de är svårt skadade."
        }
    }
}
