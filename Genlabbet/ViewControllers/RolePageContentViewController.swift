import UIKit
import Cartography
import TTTAttributedLabel

class RolePageContentViewController: UIViewController, TTTAttributedLabelDelegate {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(role: Role, pageIndex: Int) {
        self.role = role
        self.pageIndex = pageIndex
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        constrain(scrollView) { scrollView in
            scrollView.edges == scrollView.superview!.edges
        }
        
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(keyAttributeLabel)
        scrollView.addSubview(specialistSkillLabel)
        scrollView.addSubview(talentsLabel)
        scrollView.addSubview(imageView)
        
        let verticalSpacing = 10.0 as CGFloat
        
        constrain(headerLabel, descriptionLabel, keyAttributeLabel) { header, description, attribute in
            header.width   == header.superview!.width
            header.top     == header.superview!.top
            header.centerX == header.superview!.centerX
            
            description.width   == description.superview!.width
            description.top     == header.bottom + 5.0
            description.centerX == description.superview!.centerX
            
            attribute.width   == attribute.superview!.width - TotalSideMargin
            attribute.top     == description.bottom + verticalSpacing
            attribute.centerX == attribute.superview!.centerX
        }
        
        constrain(keyAttributeLabel, specialistSkillLabel, talentsLabel) { attribute, skill, talents in
            skill.width   == skill.superview!.width - TotalSideMargin
            skill.top     == attribute.bottom + verticalSpacing
            skill.centerX == skill.superview!.centerX
            
            talents.width   == talents.superview!.width - TotalSideMargin
            talents.top     == skill.bottom + verticalSpacing
            talents.centerX == talents.superview!.centerX
        }
        
        constrain(talentsLabel, imageView) { talents, image in
            image.width   == image.superview!.width
            image.height  == image.width * 1.359
            image.top     == talents.bottom + verticalSpacing
            image.centerX == image.superview!.centerX
        }
        
        view.layoutIfNeeded()
        
        scrollView.contentSize = scrollView.totalContentSize(addedHeight: 10.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.2, animations: {
            self.descriptionLabel.layer.backgroundColor = UIColor.brown.cgColor
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        descriptionLabel.layer.backgroundColor = UIColor.white.cgColor
    }
    
    // MARK: - Views
    
    fileprivate let scrollView = UIScrollView(frame: .zero)
    
    fileprivate lazy var headerLabel: UILabel = {
        let headerLabel = UILabel(frame: .zero)
        headerLabel.font = UIFont(name: "Colfax-Regular", size: 22.0)
        headerLabel.text = self.role.string
        headerLabel.textAlignment = .center
        
        return headerLabel
    }()
    
    fileprivate lazy var descriptionLabel: RoleDescriptionLabel = {
        let descriptionLabel = RoleDescriptionLabel(frame: .zero)
        descriptionLabel.font = UIFont(name: "Colfax-RegularItalic", size: 14.0)
        descriptionLabel.textColor = .white
        descriptionLabel.text = self.role.description
        descriptionLabel.setLineSpacing(3.0)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.edgeInsets = UIEdgeInsets(top: 15.0, left: 10.0, bottom: 15.0, right: 10.0)
        
        return descriptionLabel
    }()
    
    fileprivate lazy var keyAttributeLabel: TTTAttributedLabel = {
        let keyAttributeLabel = TTTAttributedLabel(frame: .zero)
        
        let linkFont = UIFont(name: "Colfax-Regular", size: 16.0)!
        keyAttributeLabel.linkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.blue]
        keyAttributeLabel.activeLinkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.brown]
        
        let keyAttribute = self.role.keyAttribute.string
        keyAttributeLabel.setText("Bästa grundegenskap: \(keyAttribute)")
        keyAttributeLabel.addLink(to: URL(string: "info://attribute"), with: NSMakeRange(21, keyAttribute.characters.count))
        keyAttributeLabel.delegate = self
        
        return keyAttributeLabel
    }()
    
    fileprivate lazy var specialistSkillLabel: TTTAttributedLabel = {
        let specialistSkillLabel = TTTAttributedLabel(frame: .zero)
        
        let linkFont = UIFont(name: "Colfax-Regular", size: 16.0)!
        specialistSkillLabel.linkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.blue]
        specialistSkillLabel.activeLinkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.brown]
        
        let specialistSkill = self.role.specialistSkill.string
        specialistSkillLabel.setText("Specialfärdighet: \(specialistSkill)")
        specialistSkillLabel.addLink(to: URL(string: "info://skill"), with: NSMakeRange(18, specialistSkill.characters.count))
        specialistSkillLabel.delegate = self
        
        return specialistSkillLabel
    }()
    
    fileprivate lazy var talentsLabel: TTTAttributedLabel = {
        let talentsLabel = TTTAttributedLabel(frame: .zero)
        
        let linkFont = UIFont(name: "Colfax-Regular", size: 16.0)!
        talentsLabel.linkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.blue]
        talentsLabel.activeLinkAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): linkFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.brown]
        
        let talentNames = self.role.talents.map { $0.string }
        let talentStart = [10, talentNames[0].characters.count + 12, talentNames[0].characters.count + talentNames[1].characters.count + 14]
        
        talentsLabel.lineBreakMode = .byWordWrapping // Must be set before text is set to work
        talentsLabel.numberOfLines = 0
        talentsLabel.setText("Talanger: \(talentNames[0]), \(talentNames[1]), \(talentNames[2])")
        talentsLabel.addLink(to: URL(string: "info://talent0"), with: NSMakeRange(talentStart[0], talentNames[0].characters.count))
        talentsLabel.addLink(to: URL(string: "info://talent1"), with: NSMakeRange(talentStart[1], talentNames[1].characters.count))
        talentsLabel.addLink(to: URL(string: "info://talent2"), with: NSMakeRange(talentStart[2], talentNames[2].characters.count))
        talentsLabel.delegate = self
        
        return talentsLabel
    }()
    
    // TODO: Choose image based on self.role
    fileprivate let imageView = UIImageView(image: UIImage(named: "Krigare"))
    
    // MARK: - Properties
    
    let pageIndex: Int
    let role: Role
    
    // MARK: - TTTAttributedLabelDelegate
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        guard let host = url.host, url.scheme == "info" else { return }
        
        var title = "Ingen titel"
        var message = "Ingen text"
        
        if host == "attribute" {
            title   = role.keyAttribute.string
            message = role.keyAttribute.description
        } else if host == "skill" {
            title   = role.specialistSkill.string
            message = role.specialistSkill.description
        } else if host.hasPrefix("talent") {
            let index = Int("\(host.characters.last!)")!
            title   = role.talents[index].string
            message = role.talents[index].description
        }
        
        UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "Stäng").show()
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
