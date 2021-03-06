import UIKit
import Cartography
import TTTAttributedLabel

class SkillsViewController: CharacterCreationStepViewController, TTTAttributedLabelDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Färdigheter"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .plain, target: self, action: .chooseButtonTapped)
        
        // Layout
        
        populateContentView()
        
        constrain(skillsInfoLabel, remainingPointsLabel, pointsInfoLabel) { skillsInfo, pointsLeft, pointsInfo in
            skillsInfo.top     == skillsInfo.superview!.top + 10.0
            skillsInfo.width   == skillsInfo.superview!.width - TotalSideMargin
            skillsInfo.centerX == skillsInfo.superview!.centerX
            
            pointsLeft.top     == skillsInfo.bottom + 15.0
            pointsLeft.centerX == pointsLeft.superview!.centerX
            
            pointsInfo.top     == pointsLeft.bottom + 15.0
            pointsInfo.centerX == pointsInfo.superview!.centerX
        }
        
        var previousLabel = pointsInfoLabel
        
        for skillLabel in skillLabels {
            constrain(previousLabel, skillLabel) { previous, skillLabel in
                skillLabel.top  == previous.bottom + 15.0
                skillLabel.left == skillLabel.superview!.left + SideMargin
            }
            previousLabel = skillLabel
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
    }
    
    // MARK: - Views
    
    fileprivate lazy var skillsInfoLabel: UILabel = {
        let skillsInfoLabel = UILabel(frame: .zero)
        skillsInfoLabel.font = UIFont(name: "Colfax-Regular", size: 14.0)
        skillsInfoLabel.text = "Dina färdigheter beskriver vad du har lärt dig under ditt liv i Paradisdalen. Det finns tolv allmänna färdigheter som alla kan använda. Som \(self.character.role!.string) har du även specialfärdigheten \(self.character.role!.specialistSkill.string)."
        skillsInfoLabel.numberOfLines = 0
        
        return skillsInfoLabel
    }()
    
    fileprivate lazy var remainingPointsLabel: UILabel = {
        let remainingPointsLabel = UILabel(frame: .zero)
        remainingPointsLabel.text = "Du har \(self.character.age!.skillPoints) poäng att placera ut."
        
        return remainingPointsLabel
    }()
    
    fileprivate lazy var pointsInfoLabel: UILabel = {
        let pointsInfoLabel = UILabel(frame: .zero)
        pointsInfoLabel.font = UIFont(name: "Colfax-RegularItalic", size: 12.0)
        pointsInfoLabel.text = "Antalet färdighetspoäng baseras på din rollpersons ålder."
        pointsInfoLabel.textAlignment = .center
        
        return pointsInfoLabel
    }()
    
    fileprivate lazy var skillLabels: [SkillAttributedLabel] = {
        var skillLabels = [SkillAttributedLabel(skill: self.character.role!.specialistSkill, delegate: self)]
        for skill in Skill.allGeneralSkills {
            skillLabels.append(SkillAttributedLabel(skill: skill, delegate: self))
        }
        
        return skillLabels
    }()
    
    // MARK: SkillAttributedLabel
    
    fileprivate class SkillAttributedLabel: TTTAttributedLabel {
        convenience init(skill: Skill, delegate: TTTAttributedLabelDelegate) {
            self.init(frame: .zero)
            self.delegate = delegate
            
            let linkFont = UIFont(name: "Colfax-Regular", size: 22.0)!
            linkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.blue]
            activeLinkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.brown]
            
            setText(skill.string)
            addLink(to: URL(string: "skill://\(skill.rawValue)"), with: NSMakeRange(0, skill.string.count))
        }
    }
    
    // MARK: - Methods
    
    @objc func chooseButtonTapped(_ sender: UIBarButtonItem) {
        let viewController = TalentViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    fileprivate func populateContentView() {
        contentView.addSubview(skillsInfoLabel)
        contentView.addSubview(remainingPointsLabel)
        contentView.addSubview(pointsInfoLabel)
        
        for skillLabel in skillLabels {
            contentView.addSubview(skillLabel)
        }
    }
    
    // MARK: - TTTAttributedLabelDelegate
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        guard url.scheme == "skill" else { return }
        guard let host = url.host, let rawValue = Int(host), let skill = Skill(rawValue: rawValue) else { return }
        
        let alert = UIAlertController(title: skill.string, message: skill.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Stäng", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(SkillsViewController.chooseButtonTapped(_:))
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
