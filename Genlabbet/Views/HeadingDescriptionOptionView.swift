import UIKit
import Cartography

class HeadingDescriptionOptionView: UIView {
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headingLabel)
        addSubview(descriptionLabel)
        addSubview(buttonImageView)
        
        constrain(headingLabel, descriptionLabel, buttonImageView) { heading, description, button in
            button.left    == button.superview!.left
            button.width   == heading.height - 2.0
            button.height  == heading.height - 2.0
            button.centerY == heading.centerY
            
            heading.top  == heading.superview!.top
            heading.left == button.right + 10.0
            
            description.top    == heading.bottom + 10.0
            description.left   == description.superview!.left
            description.right  == description.superview!.right
            description.bottom == description.superview!.bottom
        }
    }
    
    convenience init(talent: Talent) {
        self.init(frame: CGRectZero)
        
        headingLabel.text = talent.string
        descriptionLabel.text = talent.description
    }
    
    convenience init(animalPower: AnimalPower) {
        self.init(frame: CGRectZero)
        
        headingLabel.text = animalPower.string
        descriptionLabel.text = animalPower.description
    }
    
    // MARK: - Subviews
    
    private let headingLabel = ChoiceHeadingLabel(text: "")
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel(frame: CGRectZero)
        descriptionLabel.numberOfLines = 0
        
        return descriptionLabel
    }()
    
    private lazy var buttonImageView: UIImageView = {
        return UIImageView(image: self.unselectedButtonImage)
    }()
    
    // MARK: - Properties
    
    private let unselectedButtonImage = UIImage(named: "RadioButtonUnselected")
    private let selectedButtonImage   = UIImage(named: "RadioButtonSelected")
    
    var selected = false {
        didSet {
            buttonImageView.image = selected ? selectedButtonImage : unselectedButtonImage
        }
    }
}
