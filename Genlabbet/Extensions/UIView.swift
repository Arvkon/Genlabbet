import UIKit

extension UIView {
    
    func totalContentSize(addedHeight: CGFloat = 0.0) -> CGSize {
        var contentRect = CGRect.zero
        for view in subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        return CGSize(width: contentRect.width, height: contentRect.height + addedHeight)
    }
}
