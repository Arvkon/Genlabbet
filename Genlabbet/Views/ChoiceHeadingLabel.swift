import UIKit

class ChoiceHeadingLabel: UILabel {
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text labelText: String) {
        super.init(frame: .zero)
        
        font = UIFont(name: "Colfax-Regular", size: 22.0)
        text = labelText
    }
}
