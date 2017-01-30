import UIKit

extension UILabel {
    
    func intrinsicWidth() -> CGFloat {
        guard let labelText = text else { return 0.0 }
        
        let boundingSize = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        let attributedString = NSAttributedString(string: labelText, attributes: [NSFontAttributeName: font])
        return attributedString.boundingRect(with: boundingSize, options: .usesLineFragmentOrigin, context: nil).width
    }
    
    func intrinsicHeightForWidth(_ width: CGFloat) -> CGFloat {
        guard let labelText = text else { return 0.0 }
        
        let boundingSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let attributedString = NSAttributedString(string: labelText, attributes: [NSFontAttributeName: font])
        return attributedString.boundingRect(with: boundingSize, options: .usesLineFragmentOrigin, context: nil).height
    }
    
    func intrinsicHeight() -> CGFloat {
        return intrinsicHeightForWidth(UIScreen.main.bounds.size.width)
    }
}
