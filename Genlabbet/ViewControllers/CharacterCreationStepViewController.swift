import UIKit
import Cartography

class CharacterCreationStepViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.contentView)
        self.view.addSubview(self.progressBar)
        
        layout(self.contentView, self.progressBar) { contentView, progressBar in
            contentView.width   == contentView.superview!.width
            contentView.height  == contentView.superview!.height - 44.0
            contentView.top     == contentView.superview!.top
            contentView.centerX == contentView.superview!.centerX
            
            progressBar.width   == progressBar.superview!.width
            progressBar.height  == 44.0
            progressBar.bottom  == progressBar.superview!.bottom
            progressBar.centerX == progressBar.superview!.centerX
        }
    }
    
    // MARK: - Views
    
    internal let contentView = UIView(frame: CGRectZero)
    internal let progressBar = ProgressBarView(frame: CGRectZero)
}
