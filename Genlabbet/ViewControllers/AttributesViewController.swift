import UIKit
import Cartography

class AttributesViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Grundegenskaper"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .plain, target: self, action: .chooseButtonTapped)
        
        // Layout
        
        populateContentView()
        
        // Dummy content
        STYDistributionView.backgroundColor = UIColor.red
        KYLDistributionView.backgroundColor = UIColor.blue
        SKPDistributionView.backgroundColor = UIColor.green
        INSDistributionView.backgroundColor = UIColor.orange
        
        let topSpacing = 10.0 as CGFloat
        let distributionViewHeight = 40.0 as CGFloat
        
        constrain(attributesInfoLabel, remainingPointsLabel, STYHeading) { attributes, points, heading in
            attributes.top     == attributes.superview!.top + topSpacing
            attributes.width   == attributes.superview!.width - TotalSideMargin
            attributes.centerX == attributes.superview!.centerX
            
            points.top     == attributes.bottom + 15.0
            points.centerX == points.superview!.centerX
            
            heading.top  == points.bottom + 15.0
            heading.left == heading.superview!.left + SideMargin
        }
        
        constrain(STYHeading, STYInfoLabel, STYDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - TotalSideMargin
            info.centerX == info.superview!.centerX
            
            view.top     == info.bottom + topSpacing
            view.width   == view.superview!.width
            view.height  == distributionViewHeight
            view.centerX == view.superview!.centerX
        }
        
        constrain(STYDistributionView, KYLHeading) { view, head in
            head.top  == view.bottom + topSpacing
            head.left == head.superview!.left + SideMargin
        }
        
        constrain(KYLHeading, KYLInfoLabel, KYLDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - TotalSideMargin
            info.centerX == info.superview!.centerX
            
            view.top     == info.bottom + topSpacing
            view.width   == view.superview!.width
            view.height  == distributionViewHeight
            view.centerX == view.superview!.centerX
        }
        
        constrain(KYLDistributionView, SKPHeading) { view, head in
            head.top  == view.bottom + topSpacing
            head.left == head.superview!.left + SideMargin
        }
        
        constrain(SKPHeading, SKPInfoLabel, SKPDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - TotalSideMargin
            info.centerX == info.superview!.centerX
            
            view.top     == info.bottom + topSpacing
            view.width   == view.superview!.width
            view.height  == distributionViewHeight
            view.centerX == view.superview!.centerX
        }
        
        constrain(SKPDistributionView, INSHeading) { view, head in
            head.top  == view.bottom + topSpacing
            head.left == head.superview!.left + SideMargin
        }
        
        constrain(INSHeading, INSInfoLabel, INSDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - TotalSideMargin
            info.centerX == info.superview!.centerX
            
            view.top     == info.bottom + topSpacing
            view.width   == view.superview!.width
            view.height  == distributionViewHeight
            view.centerX == view.superview!.centerX
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
    }
    
    // MARK: - Views
    
    fileprivate lazy var attributesInfoLabel: UILabel = {
        let attributesInfoLabel = UILabel(frame: CGRect.zero)
        attributesInfoLabel.font = UIFont(name: "Colfax-Regular", size: 14.0)
        attributesInfoLabel.text = "De fyra grundegenskaperna visar dina grundläggande fysiska och mentala förutsättningar. De mäts på en skala från 1 till 5, där högre är bättre."
        attributesInfoLabel.numberOfLines = 0
        
        return attributesInfoLabel
    }()
    
    fileprivate lazy var remainingPointsLabel: UILabel = {
        let remainingPointsLabel = UILabel(frame: CGRect.zero)
        remainingPointsLabel.text = "Du har 6 poäng att placera ut."
        
        return remainingPointsLabel
    }()
    
    fileprivate let STYHeading = ChoiceHeadingLabel(text: Attribute.strength.stringWithAbbreviation)
    fileprivate let KYLHeading = ChoiceHeadingLabel(text: Attribute.agility.stringWithAbbreviation)
    fileprivate let SKPHeading = ChoiceHeadingLabel(text: Attribute.wits.stringWithAbbreviation)
    fileprivate let INSHeading = ChoiceHeadingLabel(text: Attribute.instinct.stringWithAbbreviation)
    
    fileprivate let STYInfoLabel = AttributeInfoLabel(attribute: .strength)
    fileprivate let KYLInfoLabel = AttributeInfoLabel(attribute: .agility)
    fileprivate let SKPInfoLabel = AttributeInfoLabel(attribute: .wits)
    fileprivate let INSInfoLabel = AttributeInfoLabel(attribute: .instinct)
    
    // Dummy views
    fileprivate let STYDistributionView = UIView(frame: CGRect.zero)
    fileprivate let KYLDistributionView = UIView(frame: CGRect.zero)
    fileprivate let SKPDistributionView = UIView(frame: CGRect.zero)
    fileprivate let INSDistributionView = UIView(frame: CGRect.zero)
    
    // MARK: AttributeInfoLabel
    
    fileprivate class AttributeInfoLabel: UILabel {
        convenience init(attribute: Attribute) {
            self.init(frame: CGRect.zero)
            text = attribute.description
            numberOfLines = 0
        }
    }
    
    // MARK: - Methods
    
    func chooseButtonTapped(_ sender: UIBarButtonItem) {
        let viewController = SkillsViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    fileprivate func populateContentView() {
        contentView.addSubview(attributesInfoLabel)
        contentView.addSubview(remainingPointsLabel)
        
        contentView.addSubview(STYHeading)
        contentView.addSubview(KYLHeading)
        contentView.addSubview(SKPHeading)
        contentView.addSubview(INSHeading)
        
        contentView.addSubview(STYInfoLabel)
        contentView.addSubview(KYLInfoLabel)
        contentView.addSubview(SKPInfoLabel)
        contentView.addSubview(INSInfoLabel)
        
        contentView.addSubview(STYDistributionView)
        contentView.addSubview(KYLDistributionView)
        contentView.addSubview(SKPDistributionView)
        contentView.addSubview(INSDistributionView)
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(AttributesViewController.chooseButtonTapped(_:))
}
