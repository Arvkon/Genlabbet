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
        
        view.backgroundColor = UIColor.white
        
        // Hide back button label
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        view.addSubview(contentView)
        view.addSubview(progressBar)
        
        constrain(contentView, progressBar) { contentView, progressBar in
            contentView.width   == contentView.superview!.width
            contentView.height  == contentView.superview!.height - 44.0
            contentView.top     == contentView.superview!.top
            contentView.centerX == contentView.superview!.centerX
            
            progressBar.width   == progressBar.superview!.width
            progressBar.height  == 44.0
            progressBar.bottom  == progressBar.superview!.bottom
            progressBar.centerX == progressBar.superview!.centerX
        }
        
        view.layoutIfNeeded()
    }
    
    // MARK: - Views
    
    internal let contentView = UIScrollView(frame: CGRect.zero)
    internal let progressBar = ProgressBarView(frame: CGRect.zero)
    
    // MARK: - Properties
    
    internal let character: Character
}
