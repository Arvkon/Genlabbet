import UIKit
import Cartography

class AnimalTypeOptionView: UIView {
    
    // MARK: - NSObject
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.label)
        self.addSubview(self.imageView)
    }
    
    convenience init(text: String, imageName: String) {
        self.init(frame: CGRectZero)
        
        self.label.text = text
        self.imageView.image = UIImage(named: imageName)
    }
    
    // MARK: - Methods
    
    func select() {
        println("TODO: Mark '\(self.label.text!)' as selected")
    }
    
    func deselect() {
        println("TODO: Deselect '\(self.label.text!)'")
    }
    
    // MARK: - Subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout(self.label, self.imageView) { label, image in
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
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.text = "No text set"
        label.numberOfLines = 1
        
        return label
    }()
    
    private let imageView = UIImageView(frame: CGRectZero)
    
    // MARK: - Constants
    
    static let labelHeight = 35.0 as Double
}
