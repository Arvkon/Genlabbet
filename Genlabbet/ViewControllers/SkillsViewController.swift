import UIKit
import Cartography
import TTTAttributedLabel

class SkillsViewController: CharacterCreationStepViewController, TTTAttributedLabelDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Färdigheter"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: .chooseButtonTapped)
        
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
    
    private lazy var skillsInfoLabel: UILabel = {
        let skillsInfoLabel = UILabel(frame: CGRectZero)
        skillsInfoLabel.font = UIFont(name: "Colfax-Regular", size: 14.0)
        skillsInfoLabel.text = "Dina färdigheter beskriver vad du har lärt dig under ditt liv i Paradisdalen. Det finns tolv allmänna färdigheter som alla kan använda. Som \(self.character.syssla!.string()) har du även specialfärdigheten \(self.character.syssla!.specialistSkill().string())."
        skillsInfoLabel.numberOfLines = 0
        
        return skillsInfoLabel
    }()
    
    private lazy var remainingPointsLabel: UILabel = {
        let remainingPointsLabel = UILabel(frame: CGRectZero)
        remainingPointsLabel.text = "Du har \(self.character.ålder!.skillPoints()) poäng att placera ut."
        
        return remainingPointsLabel
    }()
    
    private lazy var pointsInfoLabel: UILabel = {
        let pointsInfoLabel = UILabel(frame: CGRectZero)
        pointsInfoLabel.font = UIFont(name: "Colfax-RegularItalic", size: 12.0)
        pointsInfoLabel.text = "Antalet färdighetspoäng baseras på din rollpersons ålder."
        pointsInfoLabel.textAlignment = .Center
        
        return pointsInfoLabel
    }()
    
    private lazy var skillLabels: [SkillAttributedLabel] = {
        var skillLabels = [SkillAttributedLabel(skill: self.character.syssla!.specialistSkill(), delegate: self)]
        for skill in Skill.allGeneralSkills {
            skillLabels.append(SkillAttributedLabel(skill: skill, delegate: self))
        }
        
        return skillLabels
    }()
    
    // MARK: SkillAttributedLabel
    
    private class SkillAttributedLabel: TTTAttributedLabel {
        convenience init(skill: Skill, delegate: TTTAttributedLabelDelegate) {
            self.init(frame: CGRectZero)
            self.delegate = delegate
            
            let linkFont = UIFont(name: "Colfax-Regular", size: 22.0)!
            linkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.blueColor()]
            activeLinkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.brownColor()]
            
            setText(skill.string())
            addLinkToURL(NSURL(string: "skill://\(skill.rawValue)"), withRange: NSMakeRange(0, skill.string().characters.count))
        }
    }
    
    // MARK: - Methods
    
    func chooseButtonTapped(sender: UIBarButtonItem) {
        UIAlertView(title: "Not implemented yet", message: "Did press choose button.", delegate: nil, cancelButtonTitle: "Stäng").show()
    }
    
    private func populateContentView() {
        contentView.addSubview(skillsInfoLabel)
        contentView.addSubview(remainingPointsLabel)
        contentView.addSubview(pointsInfoLabel)
        
        for skillLabel in skillLabels {
            contentView.addSubview(skillLabel)
        }
    }
    
    // MARK: - TTTAttributedLabelDelegate
    
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        guard url.scheme == "skill" else { return }
        guard let host = url.host, rawValue = Int(host), skill = Skill(rawValue: rawValue) else { return }
        
        UIAlertView(title: skill.string(), message: skill.description(), delegate: nil, cancelButtonTitle: "Stäng").show()
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(SkillsViewController.chooseButtonTapped(_:))
}
