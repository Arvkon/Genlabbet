import UIKit
import Cartography
import SwiftColor

class RadioButtonView: UIView {
    
    // MARK: - Initialization
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text labelText: String) {
        super.init(frame: CGRectZero)
        
        self.label.text = labelText
        
        self.addSubview(self.imageView)
        self.addSubview(self.label)
        
        // TODO: Put in layoutSubviews()?
        layout(self.imageView, self.label) { image, label in
            image.width   == self.imageSide
            image.height  == self.imageSide
            image.left    == image.superview!.left
            image.centerY == image.superview!.centerY
            
            label.height  == label.superview!.height
            label.left    == image.right + self.spacing
            label.centerY == label.superview!.centerY
        }
    }
    
    // MARK: - Subviews
    
    private lazy var imageView = UIImageView(image: UIImage(named: "RadioButtonUnselected"))
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.textColor = UIColor("91969d")
        label.font = self.labelFont
        
        return label
    }()
    
    // MARK: - Methods
    
    func intrinsicWidth() -> CGFloat {
        if let labelText = self.label.text {
            var attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSFontAttributeName, value: self.labelFont, range: NSMakeRange(0, count(labelText)))
            let boundingSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
            let labelWidth = attributedString.boundingRectWithSize(boundingSize, options: .UsesLineFragmentOrigin, context: nil).width
            
            return min(labelWidth + self.spacing + self.imageSide, UIScreen.mainScreen().bounds.size.width)
        } else {
            return -1.0
        }
    }
    
    // MARK: - Properties
    
    private let spacing   = 10.0 as CGFloat
    private let imageSide = 18.0 as CGFloat
    private let labelFont = UIFont(name: "HelveticaNeue-Light", size: 16.0)!
    
    var selected = false {
        didSet {
            if selected == true {
                self.imageView.image = UIImage(named: "RadioButtonSelected")
                self.label.textColor = UIColor("3f4854")
            } else {
                self.imageView.image = UIImage(named: "RadioButtonUnselected")
                self.label.textColor = UIColor("91969d")
            }
        }
    }
}
