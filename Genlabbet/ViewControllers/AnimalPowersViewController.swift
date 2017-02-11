import UIKit
import Cartography

class AnimalPowersViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Djurförmågor"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .plain, target: self, action: .chooseButtonTapped)
        navigationItem.rightBarButtonItem!.isEnabled = false
        
        // Layout
        
        populateContentView()
        
        constrain(animalPowersHeading) { animalPowers in
            animalPowers.top     == animalPowers.superview!.top + 15.0
            animalPowers.width   == animalPowers.superview!.width - TotalSideMargin
            animalPowers.centerX == animalPowers.superview!.centerX
        }
        
        var previousView: UIView = animalPowersHeading
        
        for animalPowerView in animalPowerViews {
            constrain(previousView, animalPowerView) { previous, animalPower in
                animalPower.top     == previous.bottom + 25.0
                animalPower.width   == animalPower.superview!.width - TotalSideMargin
                animalPower.centerX == animalPower.superview!.centerX
            }
            constrain(animalPowerView) { animalPower in
                animalPower.height == animalPowerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
            }
            previousView = animalPowerView
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
        
        for animalPowerView in animalPowerViews {
            animalPowerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .animalPowerButtonTapped))
        }
    }
    
    // MARK: - Views
    
    fileprivate lazy var animalPowersHeading: ChoiceHeadingLabel = {
        let animalType = self.character.animalType!.pluralDefiniteFormString
        let animalPowersHeading = ChoiceHeadingLabel(text: "\(animalType)s förmågor (välj två)")
        animalPowersHeading.numberOfLines = 2 // For small screens
        
        return animalPowersHeading
    }()
    
    fileprivate lazy var animalPowerViews: [HeadingDescriptionOptionView] = {
        return self.character.animalType!.animalPowers.map { HeadingDescriptionOptionView(animalPower: $0) }
    }()
    
    // MARK: - Methods
    
    func chooseButtonTapped(_ sender: UIBarButtonItem) {
        let viewController = RankRelationshipsDreamViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    func animalPowerButtonTapped(_ sender: UITapGestureRecognizer?) {
        guard let tappedAnimalPowerView = sender?.view as? HeadingDescriptionOptionView else { return }
        
        if tappedAnimalPowerView.selected == true {
            tappedAnimalPowerView.selected = false
            navigationItem.rightBarButtonItem!.isEnabled = false
        } else {
            let powersPickedAlready = animalPowerViews.filter({ $0.selected == true }).count
            navigationItem.rightBarButtonItem!.isEnabled = powersPickedAlready > 0
            tappedAnimalPowerView.selected = powersPickedAlready < 2
        }
    }
    
    fileprivate func populateContentView() {
        contentView.addSubview(animalPowersHeading)
        
        for animalPowerView in animalPowerViews {
            contentView.addSubview(animalPowerView)
        }
    }
}

private extension Selector {
    static let chooseButtonTapped      = #selector(AnimalPowersViewController.chooseButtonTapped(_:))
    static let animalPowerButtonTapped = #selector(AnimalPowersViewController.animalPowerButtonTapped(_:))
}
