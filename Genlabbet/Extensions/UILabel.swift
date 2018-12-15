import UIKit

extension UILabel {
    
    func intrinsicWidth() -> CGFloat {
        guard let labelText = text else { return 0.0 }
        
        let boundingSize = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        let attributedString = NSAttributedString(string: labelText, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): font]))
        return attributedString.boundingRect(with: boundingSize, options: .usesLineFragmentOrigin, context: nil).width
    }
    
    func intrinsicHeightForWidth(_ width: CGFloat) -> CGFloat {
        guard let labelText = text else { return 0.0 }
        
        let boundingSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let attributedString = NSAttributedString(string: labelText, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): font]))
        return attributedString.boundingRect(with: boundingSize, options: .usesLineFragmentOrigin, context: nil).height
    }
    
    func intrinsicHeight() -> CGFloat {
        return intrinsicHeightForWidth(UIScreen.main.bounds.size.width)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
