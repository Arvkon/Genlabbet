import UIKit
import Cartography

class AnimalTypeOptionView: UIView {
    
    // MARK: - NSObject
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Initialization
    
    init(animalType: AnimalType) {
        self.animalType = animalType
        super.init(frame: CGRect.zero)
        
        addSubview(label)
        addSubview(imageView)
        
        label.text = animalType.string
        
        if animalType == .björn {
            imageView.image = UIImage(named: "Bjorn")
        } else if animalType == .mårddjur {
            imageView.image = UIImage(named: "Marddjur")
        } else {
            imageView.image = UIImage(named: animalType.string)
        }
    }
    
    // MARK: - Methods
    
    func select() {
        print("TODO: Mark '\(label.text!)' as selected")
    }
    
    func deselect() {
        print("TODO: Deselect '\(label.text!)'")
    }
    
    // MARK: - Subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        constrain(label, imageView) { label, image in
            label.width   == label.superview!.width
            label.height  == AnimalTypeOptionView.labelHeight
            label.top     == label.superview!.top
            label.centerX == label.superview!.centerX
            
            image.width   == image.superview!.width
            image.height  == image.width
            image.top     == label.bottom
            image.centerX == image.superview!.centerX
        }
    }
    
    fileprivate lazy var label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
        label.textAlignment = .center
        label.text = "No text set"
        
        return label
    }()
    
    fileprivate let imageView = UIImageView(frame: CGRect.zero)
    
    // MARK: - Properties & Constants
    
    internal let animalType: AnimalType
    
    static internal let labelHeight = 35.0 as CGFloat
}
