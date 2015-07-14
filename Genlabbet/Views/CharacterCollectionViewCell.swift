import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - NSObject
    
    required init(coder: NSCoder) {
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
        
        self.contentView.addSubview(self.nameLabel)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellPressAction = nil
    }
    
    // MARK: - Subviews
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: self.contentView.frame.width - 15.0, height: 44.0))
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.text = "Text has not been set"
        nameLabel.numberOfLines = 1
        
        return nameLabel
    }()
    
    func setLabelText(text: String) {
        self.nameLabel.text = text
    }
    
    // MARK: - User Interaction
    
    var cellPressAction: (() -> Void)?
    
    func performCellPressAction() {
        if let cellPressAction = self.cellPressAction {
            cellPressAction()
        }
    }
}
