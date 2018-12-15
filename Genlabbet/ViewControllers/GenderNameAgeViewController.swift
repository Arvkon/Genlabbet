import UIKit
import Cartography

class GenderNameAgeViewController: CharacterCreationStepViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Kön, namn och ålder"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .plain, target: self, action: .chooseButtonTapped)
        navigationItem.rightBarButtonItem!.isEnabled = false
        
        // Layout
        
        populateContentView()
        
        // TODO: Layout code below needs improvement
        
        let labelTopSpacing = 15.0 as CGFloat
        let fieldTopSpacing = 10.0 as CGFloat
        
        let maleWidth   = XYRadioButton.intrinsicWidth()
        let femaleWidth = XXRadioButton.intrinsicWidth()
        
        constrain(genderHeading, XYRadioButton, XXRadioButton) { gender, male, female in
            gender.width   == gender.superview!.width - TotalSideMargin
            gender.top     == gender.superview!.top + 10.0
            gender.centerX == gender.superview!.centerX
            
            male.width     == maleWidth
            male.right     == male.superview!.centerX - 15.0
            male.centerY   == gender.centerY
            
            female.width   == femaleWidth
            female.left    == female.superview!.centerX + 15.0
            female.centerY == gender.centerY
        }
        
        constrain(genderHeading, genderInfoLabel) { gender, genderInfo in
            genderInfo.width   == genderInfo.superview!.width - TotalSideMargin
            genderInfo.top     == gender.bottom + labelTopSpacing
            genderInfo.centerX == genderInfo.superview!.centerX
        }
        
        constrain(genderInfoLabel, labNameHeading, labNameInfoLabel) { genderInfo, labName, labInfo in
            labName.width   == labName.superview!.width - TotalSideMargin
            labName.top     == genderInfo.bottom + labelTopSpacing
            labName.centerX == labName.superview!.centerX
            
            labInfo.width   == labInfo.superview!.width - TotalSideMargin
            labInfo.top     == labName.bottom + fieldTopSpacing
            labInfo.centerX == labInfo.superview!.centerX
        }
        
        constrain(labNameInfoLabel, labNameTextField) { labInfo, nameField in
            nameField.width   == nameField.superview!.width - TotalSideMargin
            nameField.top     == labInfo.bottom + fieldTopSpacing
            nameField.centerX == nameField.superview!.centerX
        }
        
        constrain(labNameTextField, rebelNameHeading, rebelNameInfoLabel) { nameField, rebelName, rebelInfo in
            rebelName.width   == rebelName.superview!.width - TotalSideMargin
            rebelName.top     == nameField.bottom + labelTopSpacing
            rebelName.centerX == rebelName.superview!.centerX
            
            rebelInfo.width   == rebelInfo.superview!.width - TotalSideMargin
            rebelInfo.top     == rebelName.bottom + fieldTopSpacing
            rebelInfo.centerX == rebelInfo.superview!.centerX
        }
        
        constrain(rebelNameInfoLabel, rebelNameTextField) { rebelInfo, nameField in
            nameField.width   == nameField.superview!.width - TotalSideMargin
            nameField.top     == rebelInfo.bottom + fieldTopSpacing
            nameField.centerX == nameField.superview!.centerX
        }
        
        // TODO: Radio buttons in container view?
        
        let youngWidth = youngRadioButton.intrinsicWidth()
        let adultWidth = adultRadioButton.intrinsicWidth()
        let elderWidth = elderRadioButton.intrinsicWidth()
        
        constrain(rebelNameTextField, ageGroupHeading, youngRadioButton) { nameField, ageLabel, youngButton in
            ageLabel.width   == ageLabel.superview!.width - TotalSideMargin
            ageLabel.top     == nameField.bottom + labelTopSpacing
            ageLabel.centerX == ageLabel.superview!.centerX
            
            youngButton.width   == youngWidth
            youngButton.right   == youngButton.superview!.centerX - 15.0
            youngButton.centerY == ageLabel.centerY
        }
        
        constrain(youngRadioButton, adultRadioButton, elderRadioButton) { young, adult, elder in
            adult.width   == adultWidth
            adult.left    == young.right + 15.0
            adult.centerY == young.centerY
            
            elder.width   == elderWidth
            elder.left    == adult.right + 15.0
            elder.centerY == young.centerY
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
        
        addGestureRecognizersToRadioButtons()
        
        // Hide keyboard if user taps outside text fields
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: view, action: .endEditing))
    }
    
    // MARK: - Labels
    
    fileprivate let genderHeading    = ChoiceHeadingLabel(text: "Kön")
    fileprivate let labNameHeading   = ChoiceHeadingLabel(text: "Labbnamn")
    fileprivate let rebelNameHeading = ChoiceHeadingLabel(text: "Upprorsnamn (frivilligt)")
    fileprivate let ageGroupHeading  = ChoiceHeadingLabel(text: "Ålder")
    
    fileprivate lazy var genderInfoLabel: UILabel = {
        let genderInfoLabel = UILabel(frame: .zero)
        genderInfoLabel.font = UIFont(name: "Colfax-RegularItalic", size: 12.0)
        genderInfoLabel.text = "Kön gör ingen som helst regelteknisk skillnad."
        genderInfoLabel.textAlignment = .center
        
        return genderInfoLabel
    }()
    
    fileprivate lazy var labNameInfoLabel: UILabel = {
        let labNameInfoLabel = UILabel(frame: .zero)
        if let animalType = self.character.animalType {
            labNameInfoLabel.text = animalType.namingConventionText
        }
        labNameInfoLabel.numberOfLines = 0
        
        return labNameInfoLabel
    }()
    
    fileprivate lazy var rebelNameInfoLabel: UILabel = {
        let rebelNameInfoLabel = UILabel(frame: .zero)
        rebelNameInfoLabel.text = "I det gryende Upprorets kretsar avfärdas de traditionella labbnamnen som “slavnamn”. I hemlighet tar sig Upprorets anhängare “upprorsnamn”, som oftast bygger på någon personlig egenskap."
        rebelNameInfoLabel.numberOfLines = 0
        
        return rebelNameInfoLabel
    }()
    
    // MARK: Radio buttons
    
    fileprivate let XYRadioButton = RadioButtonView(text: "Hane")
    fileprivate let XXRadioButton = RadioButtonView(text: "Hona")
    
    fileprivate let youngRadioButton = RadioButtonView(text: Age.youngster.string)
    fileprivate let adultRadioButton = RadioButtonView(text: Age.mature.string)
    fileprivate let elderRadioButton = RadioButtonView(text: Age.elder.string)
    
    // MARK: Text fields & Picker views
    
    fileprivate lazy var labNameTextField: ChoiceTextField = {
        let labNameTextField = ChoiceTextField(frame: .zero)
        labNameTextField.inputView = self.labNamePickerView
        labNameTextField.delegate = self
        
        return labNameTextField
    }()
    
    fileprivate lazy var rebelNameTextField: ChoiceTextField = {
        let rebelNameTextField = ChoiceTextField(frame: .zero)
        rebelNameTextField.inputView = self.rebelNamePickerView
        rebelNameTextField.delegate = self
        
        rebelNameTextField.text = self.rebelNames.first
        
        return rebelNameTextField
    }()
    
    fileprivate lazy var labNamePickerView: UIPickerView = {
        let labNamePickerView = UIPickerView(frame: .zero)
        labNamePickerView.backgroundColor = UIColor("f8f8f8")
        labNamePickerView.dataSource = self
        labNamePickerView.delegate = self
        
        return labNamePickerView
    }()
    
    fileprivate lazy var rebelNamePickerView: UIPickerView = {
        let rebelNamePickerView = UIPickerView(frame: .zero)
        rebelNamePickerView.backgroundColor = UIColor("f8f8f8")
        rebelNamePickerView.dataSource = self
        rebelNamePickerView.delegate = self
        
        return rebelNamePickerView
    }()
    
    // MARK: - Methods
    
    @objc func chooseButtonTapped(_ sender: UIBarButtonItem) {
        if XYRadioButton.selected == true {
            character.gender = .male
        } else if XXRadioButton.selected == true {
            character.gender = .female
        }
        
        character.labName = labNameTextField.text
        
        if youngRadioButton.selected == true {
            character.age = .youngster
        } else if adultRadioButton.selected == true {
            character.age = .mature
        } else if elderRadioButton.selected == true {
            character.age = .elder
        }
        
        let viewController = AttributesViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    @objc func genderButtonTapped(_ sender: UITapGestureRecognizer?) {
        guard let tappedRadioButton = sender?.view as? RadioButtonView else { return }
        
        XYRadioButton.selected = false
        XXRadioButton.selected = false
        
        tappedRadioButton.selected = true
        
        navigationItem.rightBarButtonItem!.isEnabled = allMandatoryInformationProvided()
    }
    
    @objc func ageButtonTapped(_ sender: UITapGestureRecognizer?) {
        guard let tappedRadioButton = sender?.view as? RadioButtonView else { return }
        
        youngRadioButton.selected = false
        adultRadioButton.selected = false
        elderRadioButton.selected = false
        
        tappedRadioButton.selected = true
        
        navigationItem.rightBarButtonItem!.isEnabled = allMandatoryInformationProvided()
    }
    
    fileprivate func allMandatoryInformationProvided() -> Bool {
        guard let labNameText = labNameTextField.text else { return false }
        
        let genderChosen  = XYRadioButton.selected == true || XXRadioButton.selected == true
        let labNameChosen = labNameText.characters.count > 0
        let ageChosen     = youngRadioButton.selected == true || adultRadioButton.selected == true || elderRadioButton.selected == true
        
        return genderChosen && labNameChosen && ageChosen
    }
    
    fileprivate func populateContentView() {
        contentView.addSubview(genderHeading)
        contentView.addSubview(XYRadioButton)
        contentView.addSubview(XXRadioButton)
        contentView.addSubview(genderInfoLabel)
        
        contentView.addSubview(labNameHeading)
        contentView.addSubview(labNameInfoLabel)
        contentView.addSubview(labNameTextField)
        
        contentView.addSubview(rebelNameHeading)
        contentView.addSubview(rebelNameInfoLabel)
        contentView.addSubview(rebelNameTextField)
        
        contentView.addSubview(ageGroupHeading)
        contentView.addSubview(youngRadioButton)
        contentView.addSubview(adultRadioButton)
        contentView.addSubview(elderRadioButton)
    }
    
    fileprivate func addGestureRecognizersToRadioButtons() {
        XYRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .genderButtonTapped))
        XXRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .genderButtonTapped))
        
        youngRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .ageButtonTapped))
        adultRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .ageButtonTapped))
        elderRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .ageButtonTapped))
    }
    
    // MARK: - Properties
    
    fileprivate lazy var labNames: [String] = { return self.character.animalType!.exampleNames }()
    
    fileprivate let rebelNames = ["Inget upprorsnamn", "Stortass", "Grönöga", "Snabbtass", "Stor-Klo", "Strävragg", "Fläckpäls"]
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField === labNameTextField && labNameTextField.text!.isEmpty {
            labNameTextField.text = labNames.first
        }
        navigationItem.rightBarButtonItem!.isEnabled = allMandatoryInformationProvided()
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView === labNamePickerView ? labNames[row] : rebelNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView === labNamePickerView {
            labNameTextField.text = labNames[row]
        } else {
            rebelNameTextField.text = rebelNames[row]
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView === labNamePickerView ? labNames.count : rebelNames.count
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(GenderNameAgeViewController.chooseButtonTapped(_:))
    static let genderButtonTapped = #selector(GenderNameAgeViewController.genderButtonTapped(_:))
    static let ageButtonTapped    = #selector(GenderNameAgeViewController.ageButtonTapped(_:))
    static let endEditing         = #selector(UIView.endEditing(_:))
}
