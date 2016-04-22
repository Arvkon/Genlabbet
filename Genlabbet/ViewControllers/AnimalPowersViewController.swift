import UIKit
import Cartography

class AnimalPowersViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Djurförmågor"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: .chooseButtonTapped)
        navigationItem.rightBarButtonItem!.enabled = false
        
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
                animalPower.height == animalPowerView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
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
    
    private lazy var animalPowersHeading: ChoiceHeadingLabel = {
        let djurtyp = self.character.djurtyp!.pluralDefiniteFormString()
        let animalPowersHeading = ChoiceHeadingLabel(text: "\(djurtyp)s förmågor (välj två)")
        animalPowersHeading.numberOfLines = 2 // For small screens
        
        return animalPowersHeading
    }()
    
    private lazy var animalPowerViews: [HeadingDescriptionOptionView] = {
        return self.character.djurtyp!.animalPowers().map { HeadingDescriptionOptionView(animalPower: $0) }
    }()
    
    // MARK: - Methods
    
    func chooseButtonTapped(sender: UIBarButtonItem) {
        let viewController = RankRelationshipsDreamViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    func animalPowerButtonTapped(sender: UITapGestureRecognizer?) {
        guard let tappedAnimalPowerView = sender?.view as? HeadingDescriptionOptionView else { return }
        
        if tappedAnimalPowerView.selected == true {
            tappedAnimalPowerView.selected = false
            navigationItem.rightBarButtonItem!.enabled = false
        } else {
            let powersPickedAlready = animalPowerViews.filter({ $0.selected == true }).count
            navigationItem.rightBarButtonItem!.enabled = powersPickedAlready > 0
            tappedAnimalPowerView.selected = powersPickedAlready < 2
        }
    }
    
    private func populateContentView() {
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
