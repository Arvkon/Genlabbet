import UIKit

// Code from http://stackoverflow.com/a/21267507/1500708

class RoleDescriptionLabel: UILabel {
    
    var edgeInsets = UIEdgeInsets.zero
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var rect = edgeInsets.apply(bounds)
        rect = super.textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines)
        return edgeInsets.inverse.apply(rect)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: edgeInsets.apply(rect))
    }
    
    func setLineSpacing(_ lineSpacing: CGFloat) {
        if let labelText = text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            
            let attrString = NSMutableAttributedString(string: labelText)
            let wholeRange = NSMakeRange(0, attrString.length)
            attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:wholeRange)
            
            attributedText = attrString
        }
    }
}

extension UIEdgeInsets {
    var inverse: UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
    }
    func apply(_ rect: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(rect, self)
    }
}
