import UIKit

extension UIImage {
    
    static func portrait(forAnimalType animalType: AnimalType) -> UIImage? {
        switch animalType {
        case .ape:     return UIImage(named: "Ape")
        case .badger:  return UIImage(named: "Badger")
        case .bear:    return UIImage(named: "Bear")
        case .cat:     return UIImage(named: "Cat")
        case .dog:     return UIImage(named: "Dog")
        case .rabbit:  return UIImage(named: "Rabbit")
        case .rat:     return UIImage(named: "Rat")
        case .reptile: return UIImage(named: "Reptile")
        }
    }
}
