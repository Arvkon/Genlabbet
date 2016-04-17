import UIKit
import Cartography
import SwiftColor

class RadioButtonView: UIView {
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text labelText: String) {
        super.init(frame: CGRectZero)
        
        label.text = labelText
        
        addSubview(imageView)
        addSubview(label)
        
        constrain(imageView, label) { image, label in
            image.width   == imageSide
            image.height  == imageSide
            image.left    == image.superview!.left
            image.centerY == image.superview!.centerY
            
            label.height  == label.superview!.height
            label.left    == image.right + spacing
            label.centerY == label.superview!.centerY
        }
    }
    
    // MARK: - Subviews
    
    private let imageView = UIImageView(image: UIImage(named: "RadioButtonUnselected"))
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.textColor = UIColor("91969d")
        label.font = self.labelFont
        
        return label
    }()
    
    // MARK: - Methods
    
    func intrinsicWidth() -> CGFloat {
        return min(label.intrinsicWidth() + spacing + imageSide, UIScreen.mainScreen().bounds.width)
    }
    
    // MARK: - Properties
    
    private let spacing   = 10.0 as CGFloat
    private let imageSide = 18.0 as CGFloat
    private let labelFont = UIFont(name: "HelveticaNeue-Light", size: 16.0)!
    
    var selected = false {
        didSet {
            if selected == true {
                imageView.image = UIImage(named: "RadioButtonSelected")
                label.textColor = UIColor("3f4854")
            } else {
                imageView.image = UIImage(named: "RadioButtonUnselected")
                label.textColor = UIColor("91969d")
            }
        }
    }
}
