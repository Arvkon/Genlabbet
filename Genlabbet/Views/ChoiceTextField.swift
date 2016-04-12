import UIKit

class ChoiceTextField: UITextField {
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        borderStyle = .RoundedRect
        backgroundColor = UIColor("f9f9f9")
        font = UIFont(name: "Colfax-Regular", size: 16.0)
        placeholder = "Tryck för att välja"
        contentVerticalAlignment = .Center
        textColor = UIColor.blackColor()
        tintColor = UIColor.blackColor()
        autocorrectionType = .No
    }
    
    // MARK: - Methods
    
    override func caretRectForPosition(position: UITextPosition) -> CGRect {
        return CGRectZero // Hide caret
    }
}
