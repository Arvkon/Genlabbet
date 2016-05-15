import Foundation

enum AnimalPower {
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
    case SjätteSinne
    case Stor
    case Svans
    case Varningsrop
    case Växtätare
    
    // MARK: Computed Properties
    
    var string: String {
        switch self {
        case .Amfibisk:    return "Amfibisk"
        case .Blixtsnabb:  return "Blixtsnabb"
        case .Flyktsinne:  return "Flyktsinne"
        case .Giftbett:    return "Giftbett"
        case .Grävare:     return "Grävare"
        case .Hoppförmåga: return "Hoppförmåga"
        case .Jaktsinne:   return "Jaktsinne"
        case .Klättrare:   return "Klättrare"
        case .Liten:       return "Liten"
        case .Ljudlös:     return "Ljudlös"
        case .Lurvig:      return "Lurvig"
        case .Löpsnabb:    return "Löpsnabb"
        case .Nattsyn:     return "Nattsyn"
        case .Pansar:      return "Pansar"
        case .Rovattack:   return "Rovattack"
        case .Stor:        return "Stor"
        case .SjätteSinne: return "Sjätte sinne"
        case .Svans:       return "Svans"
        case .Varningsrop: return "Varningsrop"
        case .Växtätare:   return "Växtätare"
        }
    }
    
    var description: String {
        switch self {
        case .Amfibisk:
            return "Du är lika hemma under vattenytan som över den. Denna förmåga har två effekter. Dels kan du hålla andan länge - fem minuter för varje VP du spenderar. Dels kan du spendera VP i stället för att slå tärning när du *slåss* eller *smyger* under vatten - varje VP du spenderar räknas som en [ikon]."
        case .Blixtsnabb:
            return "Dina reflexer är långt snabbare än vad någon människa kan prestera. Du kan aktivera denna förmåga när du slagit ditt initiativslag (sid 73) - varje VP du spenderar ökar ditt initiativvärde fem steg. Du kan även aktivera denna förmåga under pågående konflikt, samtidigt som du utför din handling, för att öka på ditt initiativvärde till nästa runda."
        case .Flyktsinne:
            return "Du har starka instinkter att fly när fara hotar. Genom att spendera en VP lyckas du automatiskt *fly* för att ta dig ur en konflikt eller annat hot. Förmågan ersätter inte andra sätt att använda *fly*, till exempel hopp och klättring."
        case .Giftbett:
            return "Din mun är försedd med giftkörtlar. När du lyckas *slåss* med en fiende och gör minst en poäng i skada kan du spendera valfritt antal VP för att injicera giftet. Därefter tar offret en poäng i skada per runda, i ett antal rundor lika med antalet VP du använde. Förmågan kan bara användas när du gör en obeväpnad attack. Giftet har ingen effekt på robotar."
        case .Grävare:
            return "Dina framtassar är skapade för att snabbt och effektivt gräva dig fram under marken, så länge jorden är hyfsat lös. För varje VP du spenderar kan du gräva ett tiotal meter - motsvarande en avståndskategori i konflikt. Du kan också spendera en VP för att ta dig ur en konflikt genom att gräva ner dig - du slipper då slå för att *fly*."
        case .Hoppförmåga:
            return "Med dina välutvecklade benmuskler kan du hoppa mycket högt och långt. Genom att spendera en VP kan du ta ett skutt tio meter långt eller fem meter högt. Du kan också ta några skutt fram till en fiende på kort avstånd och direkt *slåss* i samma runda. Hoppet ersätter din manöver för rundan, och kostar en VP."
        case .Jaktsinne:
            return "Dina rovinstinkter hjälper dig att jaga och nedgöra ditt byte. Du kan spendera en VP för att hitta och följa ett spår efter någon, även om spåret inte är uppenbart synligt och flera dagar har passerat. När du väl kommer i kapp ditt byte får du modifikation +1 i din första attack mot det. Du kan bara jaga ett byte i taget. Att avbryta jakten innan du anfaller ditt villebråd ger dig en poäng stress."
        case .Klättrare:
            return "Du har en naturlig förmåga att klättra snabbt och lätt. Genom att spendera en VP kan du svinga dig upp i ett träd eller till och med uppför murar och husväggar, bara det finns små skrevor att greppa tag i."
        case .Liten:
            return "Du är liten till storleken och mycket rörlig. Du kan aktivera denna förmåga när en fiende lyckas *slåss* eller *skjuta* mot dig. Varje VP du spenderar slår ut en av fiendens [ikon]."
        case .Ljudlös:
            return "Du kan röra dig helt ljudlöst, tyst som en katt om natten. Du aktiverar denna förmåga samtidigt som du slår för att *smyga*. För varje VP du spenderar får du modifikation +2 på slaget."
        case .Lurvig:
            return "Du har tjock, varm päls som både skyddar mot hugg och slag, och håller dig varm om natten. Denna förmåga har två effekter. För det första kan du spendera en VP för att slippa slå ett slag för att motstå effekterna av köld. För det andra kan du spendera en VP när du tar skada av något yttre angrepp (inte när du själv pressar ett slag). Skadan minskar då med ett. Du kan inte spendera mer än en VP åt gången för att minska skada."
        case .Löpsnabb:
            return "Du springer snabbt som vinden när du går ner på alla fyra. Genom att spendera en VP kan du fördubbla din förflyttning i en runda – varje manöver du lägger på förflyttning räknas som två (sid 75). Du kan alltså gå direkt från långt avstånd till armslängd på en runda, eller gå direkt in från kort avstånd och *slåss* i närstrid i samma runda."
        case .Nattsyn:
            return "Dina ögon kräver bara ett minimum av ljus för att se lika bra som på dagen. Genom att spendera en VP kan du ignorera alla effekter av mörker under några minuter. Att aktivera denna förmåga kräver ingen handling - du kan utföra en annan handling samtidigt."
        case .Pansar:
            return "Du bär ett skyddande skal, eller hård hud, som skyddar dig mot skada. Du kan aktivera denna förmåga när du tar skada av något yttre angrepp (inte när du själv pressar ett slag). För varje VP du spenderar minskar skadan med ett."
        case .Rovattack:
            return "Du har klor och sylvassa tänder, dödliga verktyg i närkamp skapade för att slita av halspulsådern på ditt byte. När du har lyckats *slåss* - obeväpnad - mot en fiende kan du spendera VP för att öka skadan. Varje VP ökar skadan ett steg. Rovattacken kan inte kombineras med ett närstridsvapen."
        case .SjätteSinne:
            return "Du har en djurisk förmåga att ana faran i ögonvrån, och reagera på hot innan angreppet kommer. Du kan aktivera denna förmåga när en  ende är på väg att utföra en smygattack eller ett bakhåll mot dig (sid 77). Om fienden lyckas med sitt *smyga*-slag slår du ut en [ikon] för varje VP du spenderar."
        case .Stor:
            return "Du har en reslig kroppshydda som både ökar din slagkraft och gör dig mer tålig mot skada. Denna förmåga har två effekter. För det första kan du spendera en VP när du har lyckats slåss mot en fiende (även om du använder ett vapen). Skadan ökar då med ett. För det andra kan du spendera en VP när du tar skada av något yttre angrepp (inte när du själv pressar ett slag). Skadan minskar då med ett. Du kan inte spendera mer än en VP åt gången, för någon av effekterna."
        case .Svans:
            return "Du har en lång och ståtlig svans, som hjälper dig i balansövningar. Du kan aktivera denna förmåga när du slår för att *fly* när du ska hoppa, klättra eller utföra någon annan akrobatisk övning som kräver ett stort mått av balans. För varje VP du spenderar får du en modifikation om +2 på slaget."
        case .Varningsrop:
            return "Genom att spendera en VP kan du utstöta ett varningsrop så högt att det hörs upp till en kilometer bort, under normala förhållanden. Andra djurmutanter kan tolka nyanser i ditt skri, som kan varieras för att förmedla enkla budskap som “fara”, “kom hit” eller “faran över”. Ditt skri kan även användas till att bedöva fiender på upp till nära avstånd. Ett antal offer lika med antalet VP du lägger får en poäng stress var."
        case .Växtätare:
            return "Du kan livnära dig på allehanda växter i naturen, även sådana som är oätliga för människor. Genom att spendera en VP kan du slippa behovet att äta och dricka under ett dygn."
        }
    }
}
