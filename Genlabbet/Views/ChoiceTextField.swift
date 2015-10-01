import UIKit

class ChoiceTextField: UITextField {
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.borderStyle = .RoundedRect
        self.backgroundColor = UIColor("f9f9f9")
        self.font = UIFont(name: "Colfax-Regular", size: 16.0)
        self.placeholder = "Tryck för att välja"
        self.contentVerticalAlignment = .Center
        self.textColor = UIColor.blackColor()
        self.tintColor = UIColor.blackColor()
        self.autocorrectionType = .No
    }
    
    // MARK: - Methods
    
    override func caretRectForPosition(position: UITextPosition) -> CGRect {
        return CGRectZero // Hide caret
    }
}
