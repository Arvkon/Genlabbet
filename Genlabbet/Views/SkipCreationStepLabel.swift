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
        
        setText("Du kan hoppa över detta steg.")
        addLinkToURL(NSURL(string: "skip://step"), withRange: NSMakeRange(7, 10))
        textAlignment = .Center
        delegate = self
        
        layer.borderColor = UIColor.blackColor().CGColor
        layer.borderWidth = 0.5
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
