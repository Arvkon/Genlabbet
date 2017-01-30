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
        linkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.blue]
        activeLinkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.brown]
        
        setText("Du kan hoppa över detta steg.")
        addLink(to: URL(string: "skip://step"), with: NSMakeRange(7, 10))
        textAlignment = .center
        delegate = self
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
    }
    
    // MARK: - Properties
    
    var linkAction: (() -> Void)?
    
    // MARK: - TTTAttributedLabelDelegate
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        if url.scheme == "skip" && url.host == "step" {
            linkAction?()
        }
    }
}
