import UIKit
import Cartography

class CharacterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - NSObject
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundView = UIView(frame: CGRectZero)
        backgroundView.backgroundColor = UIColor.whiteColor()
        self.backgroundView = backgroundView
        
        let selectedBackgroundView = UIView(frame: CGRectZero)
        selectedBackgroundView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        self.selectedBackgroundView = selectedBackgroundView
        
        setLabelText("Text has not been set")
        contentView.addSubview(nameLabel)
        
        constrain(nameLabel) { nameLabel in
            nameLabel.width == nameLabel.superview!.width - 15.0
            nameLabel.left  == nameLabel.superview!.left + 15.0
            nameLabel.centerY == nameLabel.superview!.centerY
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellPressAction = nil
    }
    
    // MARK: - Subviews
    
    private let nameLabel = UILabel(frame: CGRectZero)
    
    func setLabelText(text: String) {
        nameLabel.text = text
    }
    
    // MARK: - User Interaction
    
    var cellPressAction: (() -> Void)?
    
    func performCellPressAction() {
        cellPressAction?()
    }
}
