import UIKit
import TTTAttributedLabel

class SkipCreationStepLabel: TTTAttributedLabel, TTTAttributedLabelDelegate {
    
    // MARK: - Initialization
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let linkFont = UIFont(name: "Colfax-Regular", size: 16.0)!
        linkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.blueColor()]
        activeLinkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.brownColor()]
        
        let text = "Du kan hoppa över detta steg."
        setText(text, afterInheritingLabelAttributesAndConfiguringWithBlock: attributedString)
        addLinkToURL(NSURL(string: "skip://step"), withRange: NSMakeRange(7, 10))
        enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        textAlignment = .Center
        delegate = self
        
        layer.borderColor = UIColor.blackColor().CGColor
        layer.borderWidth = 0.5
    }
    
    private func attributedString(attributedString: NSMutableAttributedString!) -> NSMutableAttributedString! {
        let attributes = [
            NSFontAttributeName: UIFont(name: "Colfax-Regular", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor.blackColor(),
        ]
        attributedString.setAttributes(attributes, range: NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    // MARK: - Properties
    
    var linkAction: (() -> Void)?
    
    // MARK: - TTTAttributedLabelDelegate
    
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        if url.scheme == "skip" && url.host == "step" {
            linkAction?()
        }
    }
}
