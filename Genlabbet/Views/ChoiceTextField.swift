import UIKit

class ChoiceTextField: UITextField {
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        borderStyle = .roundedRect
        backgroundColor = UIColor("f9f9f9")
        font = UIFont(name: "Colfax-Regular", size: 16.0)
        placeholder = "Tryck för att välja"
        contentVerticalAlignment = .center
        textColor = .black
        tintColor = .black
        autocorrectionType = .no
        inputAccessoryView = pickerSeparatorView
    }

    // MARK: - Views

    fileprivate lazy var pickerSeparatorView: UIView = {
        let screenWidth = UIScreen.main.bounds.width
        let pickerSeparatorView = UIView(frame: CGRect(
            x: 0.0, y: 0.0, width: screenWidth, height: 0.5))
        pickerSeparatorView.backgroundColor = .lightGray

        return pickerSeparatorView
    }()
    
    // MARK: - Methods
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero // Hide caret
    }
}
