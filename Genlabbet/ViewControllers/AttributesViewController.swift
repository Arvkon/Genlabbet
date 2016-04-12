import UIKit
import Cartography

class AttributesViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Grundegenskaper"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: .chooseButtonTapped)
        navigationItem.rightBarButtonItem!.enabled = false
        
        // Layout
        
        populateContentView()
        
        // Dummy content
        STYDistributionView.backgroundColor = UIColor.redColor()
        KYLDistributionView.backgroundColor = UIColor.blueColor()
        SKPDistributionView.backgroundColor = UIColor.greenColor()
        INSDistributionView.backgroundColor = UIColor.orangeColor()
        
        let sideMargin = 15.0 as CGFloat
        let topSpacing = 10.0 as CGFloat
        let distributionViewHeight = 40.0 as CGFloat
        
        constrain(attributesInfoLabel, remainingPointsLabel, STYHeading) { attributes, points, heading in
            attributes.top     == attributes.superview!.top + topSpacing
            attributes.width   == attributes.superview!.width - sideMargin * 2
            attributes.centerX == attributes.superview!.centerX
            
            points.top     == attributes.bottom + 15.0
            points.centerX == points.superview!.centerX
            
            heading.top  == points.bottom + 15.0
            heading.left == heading.superview!.left + sideMargin
        }
        
        constrain(STYHeading, STYInfoLabel, STYDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - sideMargin * 2
            info.centerX == info.superview!.centerX
            
            view.top     == info.bottom + topSpacing
            view.width   == view.superview!.width
            view.height  == distributionViewHeight
            view.centerX == view.superview!.centerX
        }
        
        constrain(STYDistributionView, KYLHeading) { view, head in
            head.top  == view.bottom + topSpacing
            head.left == head.superview!.left + sideMargin
        }
        
        constrain(KYLHeading, KYLInfoLabel, KYLDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - sideMargin * 2
            info.centerX == info.superview!.centerX
            
            view.top     == info.bottom + topSpacing
            view.width   == view.superview!.width
            view.height  == distributionViewHeight
            view.centerX == view.superview!.centerX
        }
        
        constrain(KYLDistributionView, SKPHeading) { view, head in
            head.top  == view.bottom + topSpacing
            head.left == head.superview!.left + sideMargin
        }
        
        constrain(SKPHeading, SKPInfoLabel, SKPDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - sideMargin * 2
            info.centerX == info.superview!.centerX
            
            view.top     == info.bottom + topSpacing
            view.width   == view.superview!.width
            view.height  == distributionViewHeight
            view.centerX == view.superview!.centerX
        }
        
        constrain(SKPDistributionView, INSHeading) { view, head in
            head.top  == view.bottom + topSpacing
            head.left == head.superview!.left + sideMargin
        }
        
        constrain(INSHeading, INSInfoLabel, INSDistributionView) { head, info, view in
            info.top     == head.bottom + topSpacing
            info.width   == info.superview!.width - sideMargin * 2
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
    
    private lazy var attributesInfoLabel: UILabel = {
        let attributesInfoLabel = UILabel(frame: CGRectZero)
        attributesInfoLabel.font = UIFont(name: "Colfax-Regular", size: 14.0)
        attributesInfoLabel.text = "De fyra grundegenskaperna visar dina grundläggande fysiska och mentala förutsättningar. De mäts på en skala från 1 till 5, där högre är bättre."
        attributesInfoLabel.numberOfLines = 0
        
        return attributesInfoLabel
    }()
    
    private lazy var remainingPointsLabel: UILabel = {
        let remainingPointsLabel = UILabel(frame: CGRectZero)
        remainingPointsLabel.text = "Du har 6 poäng att placera ut."
        
        return remainingPointsLabel
    }()
    
    private let STYHeading = ChoiceHeadingLabel(text: Attribute.Strength.stringWithAbbreviation())
    private let KYLHeading = ChoiceHeadingLabel(text: Attribute.Agility.stringWithAbbreviation())
    private let SKPHeading = ChoiceHeadingLabel(text: Attribute.Wits.stringWithAbbreviation())
    private let INSHeading = ChoiceHeadingLabel(text: Attribute.Instinct.stringWithAbbreviation())
    
    private let STYInfoLabel = AttributeInfoLabel(attribute: .Strength)
    private let KYLInfoLabel = AttributeInfoLabel(attribute: .Agility)
    private let SKPInfoLabel = AttributeInfoLabel(attribute: .Wits)
    private let INSInfoLabel = AttributeInfoLabel(attribute: .Instinct)
    
    // Dummy views
    private let STYDistributionView = UIView(frame: CGRectZero)
    private let KYLDistributionView = UIView(frame: CGRectZero)
    private let SKPDistributionView = UIView(frame: CGRectZero)
    private let INSDistributionView = UIView(frame: CGRectZero)
    
    // MARK: AttributeInfoLabel
    
    private class AttributeInfoLabel: UILabel {
        convenience init(attribute: Attribute) {
            self.init(frame: CGRectZero)
            text = attribute.description()
            numberOfLines = 0
        }
    }
    
    // MARK: - Methods
    
    func chooseButtonTapped(sender: UIBarButtonItem) {
        UIAlertView(title: "Not implemented yet", message: "Did press choose button.", delegate: nil, cancelButtonTitle: "Stäng").show()
    }
    
    private func populateContentView() {
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
