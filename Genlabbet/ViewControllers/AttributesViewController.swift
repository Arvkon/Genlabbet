import UIKit
import Cartography

class AttributesViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Grundegenskaper"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .plain, target: self, action: .chooseButtonTapped)
        
        // Layout
        
        contentView.addSubview(stackView)
        
        constrain(stackView) { stackView in
            stackView.top      == stackView.superview!.top + TopMargin
            stackView.leading  == stackView.superview!.leading + SideMargin
            stackView.trailing == stackView.superview!.trailing + SideMargin
            stackView.width    == stackView.superview!.width - TotalSideMargin
            stackView.bottom   == stackView.superview!.bottom
        }
        
        populateStackView()
        
        // Dummy content
        STYDistributionView.backgroundColor = .red
        KYLDistributionView.backgroundColor = .blue
        SKPDistributionView.backgroundColor = .green
        INSDistributionView.backgroundColor = .orange
        
        let distributionViewHeight = 40.0 as CGFloat
        
        constrain(STYDistributionView, KYLDistributionView, SKPDistributionView, INSDistributionView) { STY, KYL, SKP, INS in
            STY.height == distributionViewHeight
            KYL.height == distributionViewHeight
            SKP.height == distributionViewHeight
            INS.height == distributionViewHeight
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
    }
    
    // MARK: - Views
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10.0
        
        return stackView
    }()
    
    fileprivate lazy var attributesInfoLabel: UILabel = {
        let attributesInfoLabel = UILabel(frame: .zero)
        attributesInfoLabel.font = UIFont(name: "Colfax-Regular", size: 14.0)
        attributesInfoLabel.text = "De fyra grundegenskaperna visar dina grundläggande fysiska och mentala förutsättningar. De mäts på en skala från 1 till 5, där högre är bättre."
        attributesInfoLabel.numberOfLines = 0
        
        return attributesInfoLabel
    }()
    
    fileprivate lazy var remainingPointsLabel: UILabel = {
        let remainingPointsLabel = UILabel(frame: .zero)
        remainingPointsLabel.text = "Du har 6 poäng att placera ut."
        remainingPointsLabel.textAlignment = .center
        
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
    fileprivate let STYDistributionView = UIView(frame: .zero)
    fileprivate let KYLDistributionView = UIView(frame: .zero)
    fileprivate let SKPDistributionView = UIView(frame: .zero)
    fileprivate let INSDistributionView = UIView(frame: .zero)
    
    // MARK: AttributeInfoLabel
    
    fileprivate class AttributeInfoLabel: UILabel {
        convenience init(attribute: Attribute) {
            self.init(frame: .zero)
            text = attribute.description
            numberOfLines = 0
        }
    }
    
    // MARK: - Methods
    
    @objc func chooseButtonTapped(_ sender: UIBarButtonItem) {
        let viewController = SkillsViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    fileprivate func populateStackView() {
        stackView.addArrangedSubview(attributesInfoLabel)
        stackView.addArrangedSubview(remainingPointsLabel) // Was 15pt from attributesInfoLabel before change to stack view
        
        stackView.addArrangedSubview(STYHeading) // Was 15pt from remainingPointsLabel before change to stack view
        stackView.addArrangedSubview(STYInfoLabel)
        stackView.addArrangedSubview(STYDistributionView)
        
        stackView.addArrangedSubview(KYLHeading)
        stackView.addArrangedSubview(KYLInfoLabel)
        stackView.addArrangedSubview(KYLDistributionView)
        
        stackView.addArrangedSubview(SKPHeading)
        stackView.addArrangedSubview(SKPInfoLabel)
        stackView.addArrangedSubview(SKPDistributionView)
        
        stackView.addArrangedSubview(INSHeading)
        stackView.addArrangedSubview(INSInfoLabel)
        stackView.addArrangedSubview(INSDistributionView)
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(AttributesViewController.chooseButtonTapped(_:))
}
