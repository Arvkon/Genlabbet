import UIKit
import Cartography

class RankRelationshipsDreamViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rang, relationer och dröm"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .plain, target: self, action: .chooseButtonTapped)
        
        // Layout
        
        populateContentView()
        
        constrain(skipCreationStepLabel, rankHeading, rankInfoLabel) { skipLabel, rankHeading, rankInfoLabel in
            skipLabel.top     == skipLabel.superview!.top + 10.0
            skipLabel.width   == skipLabel.superview!.width - TotalSideMargin
            skipLabel.centerX == skipLabel.superview!.centerX
            skipLabel.height  == 35.0
            
            rankHeading.top  == skipLabel.bottom + 15.0
            rankHeading.left == rankHeading.superview!.left + SideMargin
            
            rankInfoLabel.top     == rankHeading.bottom + 10.0
            rankInfoLabel.width   == rankInfoLabel.superview!.width - TotalSideMargin
            rankInfoLabel.centerX == rankInfoLabel.superview!.centerX
        }
        
        constrain(rankInfoLabel, rankValueLabel) { rankInfoLabel, rankValueLabel in
            rankValueLabel.top     == rankInfoLabel.bottom + 20.0
            rankValueLabel.centerX == rankValueLabel.superview!.centerX
        }
        
        constrain(rankValueLabel, rankBonusLabel, nemesisHeading) { rankValueLabel, rankBonusLabel, nemesisHeading in
            rankBonusLabel.top     == rankValueLabel.bottom + 10.0
            rankBonusLabel.centerX == rankBonusLabel.superview!.centerX
            
            nemesisHeading.top  == rankBonusLabel.bottom + 25.0
            nemesisHeading.left == nemesisHeading.superview!.left + SideMargin
        }
        
        constrain(nemesisHeading, protegeHeading, bigDreamHeading) { nemesisHeading, protegeHeading, bigDreamHeading in
            protegeHeading.top  == nemesisHeading.bottom + 15.0
            protegeHeading.left == protegeHeading.superview!.left + SideMargin
            
            bigDreamHeading.top  == protegeHeading.bottom + 15.0
            bigDreamHeading.left == bigDreamHeading.superview!.left + SideMargin
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
    }
    
    // MARK: - Views
    
    fileprivate lazy var skipCreationStepLabel: SkipCreationStepLabel = {
        let skipCreationStepLabel = SkipCreationStepLabel(frame: .zero)
        skipCreationStepLabel.linkAction = {
            let alert = UIAlertController(title: "Not implemented yet", message: "Did press skip button.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Stäng", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        return skipCreationStepLabel
    }()
    
    fileprivate lazy var rankInfoLabel: UILabel = {
        let rankInfoLabel = UILabel(frame: .zero)
        rankInfoLabel.font = UIFont(name: "Colfax-Regular", size: 14.0)
        rankInfoLabel.text = "En sak som skiljer människomutanter från djur är den strikta rangordningen i klanen. Att veta vem som är över dig och vem som är under dig i hackordningen är en självklar del av livet. Din rang är ett siffervärde från noll och uppåt. Rangen används i sociala konflikter mot andra djurmutanter."
        rankInfoLabel.numberOfLines = 0
        
        return rankInfoLabel
    }()
    
    fileprivate lazy var rankValueLabel: UILabel = {
        let rankValueLabel = UILabel(frame: .zero)
        let fontAttribute  = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.systemFont(ofSize: 19.0)]
        let attributedText = NSMutableAttributedString(string: "Du har \(self.character.rank) i rang", attributes: convertToOptionalNSAttributedStringKeyDictionary(fontAttribute))
        
        let boldFontAttribute = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.boldSystemFont(ofSize: 22.0)]
        attributedText.addAttributes(convertToNSAttributedStringKeyDictionary(boldFontAttribute), range: NSRange(location: 7, length: 1))
        rankValueLabel.attributedText = attributedText
        
        return rankValueLabel
    }()
    
    fileprivate lazy var rankBonusLabel: UILabel = {
        let rankBonusLabel = UILabel(frame: .zero)
        let ageBonusString = "\(self.character.age!.string) +\(self.character.age!.rankBonus)"
        
        let roleBonus = self.character.role!.rankBonus
        let numberSign = roleBonus > 0 ? "+" : roleBonus == 0 ? "±" : ""
        let roleBonusString = "\(self.character.role!.string) \(numberSign)\(roleBonus)"
        
        rankBonusLabel.font = UIFont(name: "Colfax-RegularItalic", size: 12.0)
        rankBonusLabel.text = ageBonusString + ", " + roleBonusString
        rankBonusLabel.textAlignment = .center
        
        return rankBonusLabel
    }()
    
    let rankHeading     = ChoiceHeadingLabel(text: "Rang")
    let nemesisHeading  = ChoiceHeadingLabel(text: "Person du hatar")
    let protegeHeading  = ChoiceHeadingLabel(text: "Person du vill skydda")
    let bigDreamHeading = ChoiceHeadingLabel(text: "Din stora dröm")
    
    // MARK: - Methods
    
    @objc func chooseButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Not implemented yet", message: "Did press choose button.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Stäng", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    fileprivate func populateContentView() {
        contentView.addSubview(skipCreationStepLabel)
        contentView.addSubview(rankHeading)
        contentView.addSubview(rankInfoLabel)
        contentView.addSubview(rankValueLabel)
        contentView.addSubview(rankBonusLabel)
        contentView.addSubview(nemesisHeading)
        contentView.addSubview(protegeHeading)
        contentView.addSubview(bigDreamHeading)
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(RankRelationshipsDreamViewController.chooseButtonTapped(_:))
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSAttributedStringKeyDictionary(_ input: [String: Any]) -> [NSAttributedString.Key: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
