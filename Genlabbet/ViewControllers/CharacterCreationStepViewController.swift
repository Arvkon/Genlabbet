import UIKit
import Cartography

class CharacterCreationStepViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Hide back button label
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        self.view.addSubview(self.contentView)
        self.view.addSubview(self.progressBar)
        
        constrain(self.contentView, self.progressBar) { contentView, progressBar in
            contentView.width   == contentView.superview!.width
            contentView.height  == contentView.superview!.height - 44.0
            contentView.top     == contentView.superview!.top
            contentView.centerX == contentView.superview!.centerX
            
            progressBar.width   == progressBar.superview!.width
            progressBar.height  == 44.0
            progressBar.bottom  == progressBar.superview!.bottom
            progressBar.centerX == progressBar.superview!.centerX
        }
        
        self.view.layoutIfNeeded()
    }
    
    // MARK: - Views
    
    internal let contentView = UIScrollView(frame: CGRectZero)
    internal let progressBar = ProgressBarView(frame: CGRectZero)
    
    // MARK: - Properties
    
    internal let character: Character
}
