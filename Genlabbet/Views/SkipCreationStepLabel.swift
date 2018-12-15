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
        linkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.blue]
        activeLinkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.brown]
        
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

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
