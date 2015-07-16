import UIKit
import Cartography
import TTTAttributedLabel

class RolePageContentViewController: UIViewController, TTTAttributedLabelDelegate {
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(role: Role, pageIndex: Int) {
        self.role = role
        self.pageIndex = pageIndex
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.scrollView)
        
        layout(self.scrollView) { scrollView in
            scrollView.left   == scrollView.superview!.left
            scrollView.right  == scrollView.superview!.right
            scrollView.top    == scrollView.superview!.top
            scrollView.bottom == scrollView.superview!.bottom
        }
        
        self.scrollView.addSubview(self.headerLabel)
        self.scrollView.addSubview(self.descriptionLabel)
        self.scrollView.addSubview(self.keyAttributeLabel)
        self.scrollView.addSubview(self.specialistSkillLabel)
        self.scrollView.addSubview(self.talentsLabel)
        self.scrollView.addSubview(self.imageView)
        
        let verticalSpacing = 10.0 as Double
        let labelSideMargin = 30.0 as Double
        
        layout(self.headerLabel, self.descriptionLabel, self.keyAttributeLabel) { header, description, attribute in
            header.width   == header.superview!.width
            header.top     == header.superview!.top
            header.centerX == header.superview!.centerX
            
            description.width   == description.superview!.width
            description.top     == header.bottom + 5.0
            description.centerX == description.superview!.centerX
            
            attribute.width   == attribute.superview!.width - labelSideMargin
            attribute.top     == description.bottom + verticalSpacing
            attribute.centerX == attribute.superview!.centerX
        }
        
        layout(self.keyAttributeLabel, self.specialistSkillLabel, self.talentsLabel) { attribute, skill, talents in
            skill.width   == skill.superview!.width - labelSideMargin
            skill.top     == attribute.bottom + verticalSpacing
            skill.centerX == skill.superview!.centerX
            
            talents.width   == talents.superview!.width - labelSideMargin
            talents.top     == skill.bottom + verticalSpacing
            talents.centerX == talents.superview!.centerX
        }
        
        layout(self.talentsLabel, self.imageView) { talents, image in
            image.width   == image.superview!.width
            image.height  == image.width * 1.359
            image.top     == talents.bottom + verticalSpacing
            image.centerX == image.superview!.centerX
        }
        
        self.scrollView.contentSize = self.scrollView.totalContentSize(addedHeight: 10.0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.2, animations: { () -> Void in
            self.descriptionLabel.layer.backgroundColor = UIColor.brownColor().CGColor
        })
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.descriptionLabel.layer.backgroundColor = UIColor.whiteColor().CGColor
    }
    
    // MARK: - Views
    
    private let scrollView = UIScrollView(frame: CGRectZero)
    
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel(frame: CGRectZero)
        headerLabel.font = UIFont(name: "Colfax-Regular", size: 22.0)
        headerLabel.text = self.role.string()
        headerLabel.textAlignment = .Center
        
        return headerLabel
    }()
    
    private lazy var descriptionLabel: RoleDescriptionLabel = {
        let descriptionLabel = RoleDescriptionLabel(frame: CGRectZero)
        descriptionLabel.font = UIFont(name: "Colfax-RegularItalic", size: 14.0)
        descriptionLabel.textColor = UIColor.whiteColor()
        descriptionLabel.text = self.role.description()
        descriptionLabel.setLineSpacing(3.0)
        descriptionLabel.textAlignment = .Center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.edgeInsets = UIEdgeInsets(top: 15.0, left: 10.0, bottom: 15.0, right: 10.0)
        
        return descriptionLabel
    }()
    
    private lazy var keyAttributeLabel: TTTAttributedLabel = {
        let keyAttributeLabel = TTTAttributedLabel(frame: CGRectZero)
        
        let linkFont = UIFont(name: "Colfax-Regular", size: 16.0)!
        keyAttributeLabel.linkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.blueColor()]
        keyAttributeLabel.activeLinkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.brownColor()]
        
        let keyAttribute = self.role.keyAttribute().string()
        let text = "Bästa grundegenskap: \(keyAttribute)"
        keyAttributeLabel.setText(text, afterInheritingLabelAttributesAndConfiguringWithBlock: self.attributedString)
        keyAttributeLabel.addLinkToURL(NSURL(string: "info://attribute"), withRange: NSMakeRange(21, count(keyAttribute)))
        keyAttributeLabel.enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        keyAttributeLabel.delegate = self
        
        return keyAttributeLabel
    }()
    
    private lazy var specialistSkillLabel: TTTAttributedLabel = {
        let specialistSkillLabel = TTTAttributedLabel(frame: CGRectZero)
        
        let linkFont = UIFont(name: "Colfax-Regular", size: 16.0)!
        specialistSkillLabel.linkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.blueColor()]
        specialistSkillLabel.activeLinkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.brownColor()]
        
        let specialistSkill = self.role.specialistSkill().string()
        let text = "Specialfärdighet: \(specialistSkill)"
        specialistSkillLabel.setText(text, afterInheritingLabelAttributesAndConfiguringWithBlock: self.attributedString)
        specialistSkillLabel.addLinkToURL(NSURL(string: "info://skill"), withRange: NSMakeRange(18, count(specialistSkill)))
        specialistSkillLabel.enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        specialistSkillLabel.delegate = self
        
        return specialistSkillLabel
    }()
    
    private lazy var talentsLabel: TTTAttributedLabel = {
        let talentsLabel = TTTAttributedLabel(frame: CGRectZero)
        
        let linkFont = UIFont(name: "Colfax-Regular", size: 16.0)!
        talentsLabel.linkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.blueColor()]
        talentsLabel.activeLinkAttributes = [NSFontAttributeName: linkFont, NSForegroundColorAttributeName: UIColor.brownColor()]
        
        let talents = self.role.talents()
        let talentNames = [talents.0.string(), talents.1.string(), talents.2.string()]
        let talentStart = [10, count(talentNames[0]) + 12, count(talentNames[0]) + count(talentNames[1]) + 14]
        
        let text = "Talanger: \(talentNames[0]), \(talentNames[1]), \(talentNames[2])"
        talentsLabel.setText(text, afterInheritingLabelAttributesAndConfiguringWithBlock: self.attributedString)
        talentsLabel.addLinkToURL(NSURL(string: "info://talent1"), withRange: NSMakeRange(talentStart[0], count(talentNames[0])))
        talentsLabel.addLinkToURL(NSURL(string: "info://talent2"), withRange: NSMakeRange(talentStart[1], count(talentNames[1])))
        talentsLabel.addLinkToURL(NSURL(string: "info://talent3"), withRange: NSMakeRange(talentStart[2], count(talentNames[2])))
        talentsLabel.enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        talentsLabel.numberOfLines = 2
        talentsLabel.delegate = self
        
        return talentsLabel
    }()
    
    // TODO: Choose image based on self.role
    private let imageView = UIImageView(image: UIImage(named: "Krigare"))
    
    // MARK: - Methods
    
    private func attributedString(attributedString: NSMutableAttributedString!) -> NSMutableAttributedString! {
        let attributes = [
            NSFontAttributeName: UIFont(name: "Colfax-Regular", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor.blackColor(),
        ]
        attributedString.setAttributes(attributes, range: NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    // MARK: - Properties
    
    let pageIndex: Int
    let role: Role
    
    // MARK: - TTTAttributedLabelDelegate
    
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        if url.scheme == "info" {
            var title = "Ingen titel"
            var message = "Ingen text"
            
            if url.host == "attribute" {
                let attribute = self.role.keyAttribute()
                title = attribute.string()
                message = attribute.description()
            } else if url.host == "skill" {
                let skill = self.role.specialistSkill()
                title = skill.string()
                message = skill.description()
            } else if url.host == "talent1" {
                let talent = self.role.talents().0
                title = talent.string()
                message = talent.description()
            } else if url.host == "talent2" {
                let talent = self.role.talents().1
                title = talent.string()
                message = talent.description()
            } else if url.host == "talent3" {
                let talent = self.role.talents().2
                title = talent.string()
                message = talent.description()
            }
            
            UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "Stäng").show()
        }
    }
}
