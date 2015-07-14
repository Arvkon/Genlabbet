import UIKit

// Code from http://stackoverflow.com/a/21267507/1500708

class RoleDescriptionLabel: UILabel {
    
    var edgeInsets = UIEdgeInsetsZero
    
    override func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var rect = edgeInsets.apply(bounds)
        rect = super.textRectForBounds(rect, limitedToNumberOfLines: numberOfLines)
        return edgeInsets.inverse.apply(rect)
    }
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(edgeInsets.apply(rect))
    }
    
    func setLineSpacing(lineSpacing: CGFloat) {
        if let labelText = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            
            let attrString = NSMutableAttributedString(string: labelText)
            let wholeRange = NSMakeRange(0, attrString.length)
            attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:wholeRange)
            
            self.attributedText = attrString
        }
    }
}

extension UIEdgeInsets {
    var inverse: UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
    }
    func apply(rect: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(rect, self)
    }
}
