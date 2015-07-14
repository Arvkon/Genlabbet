import UIKit

extension UIView {
    
    func totalContentSize(addedHeight: CGFloat = 0.0) -> CGSize {
        var contentRect = CGRectZero
        for view in self.subviews as! [UIView] {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        
        return CGSize(width: contentRect.width, height: contentRect.height + addedHeight)
    }
}