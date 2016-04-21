import UIKit
import Cartography

class TalentViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Talang"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: .chooseButtonTapped)
        navigationItem.rightBarButtonItem!.enabled = false
        
        // Layout
        
        populateContentView()
        
        constrain(talentsHeading) { talents in
            talents.top     == talents.superview!.top + 15.0
            talents.width   == talents.superview!.width - TotalSideMargin
            talents.centerX == talents.superview!.centerX
        }
        
        var previousView: UIView = talentsHeading
        
        for talentView in talentViews {
            constrain(previousView, talentView) { previous, talent in
                talent.top     == previous.bottom + 25.0
                talent.width   == talent.superview!.width - TotalSideMargin
                talent.centerX == talent.superview!.centerX
            }
            constrain(talentView) { talent in
                talent.height == talentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
            }
            previousView = talentView
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
        
        for talentView in talentViews {
            talentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .talentButtonTapped))
        }
    }
    
    // MARK: - Views
    
    private lazy var talentsHeading: ChoiceHeadingLabel = {
        let syssla = self.character.syssla!.definiteFormString()
        return ChoiceHeadingLabel(text: "\(syssla)s talanger (välj en)")
    }()
    
    private lazy var talentViews: [HeadingDescriptionOptionView] = {
        return self.character.syssla!.talents().map { HeadingDescriptionOptionView(talent: $0) }
    }()
    
    // MARK: - Methods
    
    func chooseButtonTapped(sender: UIBarButtonItem) {
        for (index, talentView) in talentViews.enumerate() {
            if talentView.selected == true {
                character.talang = character.syssla!.talents()[index]
                break
            }
        }
        let viewController = AnimalPowersViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    func talentButtonTapped(sender: UITapGestureRecognizer?) {
        guard let tappedTalentView = sender?.view as? HeadingDescriptionOptionView else { return }
        
        for talentView in talentViews {
            talentView.selected = talentView == tappedTalentView
        }
        
        navigationItem.rightBarButtonItem!.enabled = true
    }
    
    private func populateContentView() {
        contentView.addSubview(talentsHeading)
        
        for talentView in talentViews {
            contentView.addSubview(talentView)
        }
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(TalentViewController.chooseButtonTapped(_:))
    static let talentButtonTapped = #selector(TalentViewController.talentButtonTapped(_:))
}
