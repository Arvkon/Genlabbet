import UIKit

extension UILabel {
    
    func intrinsicWidth() -> CGFloat {
        guard let labelText = text else { return 0.0 }
        
        let boundingSize = CGSize(width: UIScreen.mainScreen().bounds.size.width, height: CGFloat.max)
        let attributedString = NSAttributedString(string: labelText, attributes: [NSFontAttributeName: font])
        return attributedString.boundingRectWithSize(boundingSize, options: .UsesLineFragmentOrigin, context: nil).width
    }
    
    func intrinsicHeightForWidth(width: CGFloat) -> CGFloat {
        guard let labelText = text else { return 0.0 }
        
        let boundingSize = CGSize(width: width, height: CGFloat.max)
        let attributedString = NSAttributedString(string: labelText, attributes: [NSFontAttributeName: font])
        return attributedString.boundingRectWithSize(boundingSize, options: .UsesLineFragmentOrigin, context: nil).height
    }
    
    func intrinsicHeight() -> CGFloat {
        return intrinsicHeightForWidth(UIScreen.mainScreen().bounds.size.width)
    }
}
