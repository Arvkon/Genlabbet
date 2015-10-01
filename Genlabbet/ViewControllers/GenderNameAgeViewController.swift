import UIKit
import Cartography

class GenderNameAgeViewController: CharacterCreationStepViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Kön, namn och ålder"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: "chooseButtonPressed:")
        self.navigationItem.rightBarButtonItem!.enabled = false
        
        // Layout
        
        self.populateContentView()
        
        // TODO: Layout code below needs improvement
        
        let totalSideMargin = 30.0 as CGFloat
        let labelTopSpacing = 15.0 as CGFloat
        let fieldTopSpacing = 10.0 as CGFloat
        
        let maleWidth   = self.XYRadioButton.intrinsicWidth()
        let femaleWidth = self.XXRadioButton.intrinsicWidth()
        
        constrain(self.genderHeading, self.XYRadioButton, self.XXRadioButton) { gender, male, female in
            gender.width   == gender.superview!.width - totalSideMargin
            gender.top     == gender.superview!.top + 10.0
            gender.centerX == gender.superview!.centerX
            
            male.width     == maleWidth
            male.right     == male.superview!.centerX - 15.0
            male.centerY   == gender.centerY
            
            female.width   == femaleWidth
            female.left    == female.superview!.centerX + 15.0
            female.centerY == gender.centerY
        }
        
        constrain(self.genderHeading, self.genderInfoLabel) { gender, genderInfo in
            genderInfo.width   == genderInfo.superview!.width - totalSideMargin
            genderInfo.top     == gender.bottom + labelTopSpacing
            genderInfo.centerX == genderInfo.superview!.centerX
        }
        
        constrain(self.genderInfoLabel, self.labNameHeading, self.labNameInfoLabel) { genderInfo, labName, labInfo in
            labName.width   == labName.superview!.width - totalSideMargin
            labName.top     == genderInfo.bottom + labelTopSpacing
            labName.centerX == labName.superview!.centerX
            
            labInfo.width   == labInfo.superview!.width - totalSideMargin
            labInfo.top     == labName.bottom + fieldTopSpacing
            labInfo.centerX == labInfo.superview!.centerX
        }
        
        constrain(self.labNameInfoLabel, self.labNameTextField) { labInfo, nameField in
            nameField.width   == nameField.superview!.width - totalSideMargin
            nameField.top     == labInfo.bottom + fieldTopSpacing
            nameField.centerX == nameField.superview!.centerX
        }
        
        constrain(self.labNameTextField, self.rebelNameHeading, self.rebelNameInfoLabel) { nameField, rebelName, rebelInfo in
            rebelName.width   == rebelName.superview!.width - totalSideMargin
            rebelName.top     == nameField.bottom + labelTopSpacing
            rebelName.centerX == rebelName.superview!.centerX
            
            rebelInfo.width   == rebelInfo.superview!.width - totalSideMargin
            rebelInfo.top     == rebelName.bottom + fieldTopSpacing
            rebelInfo.centerX == rebelInfo.superview!.centerX
        }
        
        constrain(self.rebelNameInfoLabel, self.rebelNameTextField) { rebelInfo, nameField in
            nameField.width   == nameField.superview!.width - totalSideMargin
            nameField.top     == rebelInfo.bottom + fieldTopSpacing
            nameField.centerX == nameField.superview!.centerX
        }
        
        // TODO: Radio buttons in container view?
        
        let youngWidth = self.youngRadioButton.intrinsicWidth()
        let adultWidth = self.adultRadioButton.intrinsicWidth()
        let elderWidth = self.elderRadioButton.intrinsicWidth()
        
        constrain(self.rebelNameTextField, self.ageGroupHeading, self.youngRadioButton) { nameField, ageLabel, youngButton in
            ageLabel.width   == ageLabel.superview!.width - totalSideMargin
            ageLabel.top     == nameField.bottom + labelTopSpacing
            ageLabel.centerX == ageLabel.superview!.centerX
            
            youngButton.width   == youngWidth
            youngButton.right   == youngButton.superview!.centerX - 15.0
            youngButton.centerY == ageLabel.centerY
        }
        
        constrain(self.youngRadioButton, self.adultRadioButton, self.elderRadioButton) { young, adult, elder in
            adult.width   == adultWidth
            adult.left    == young.right + 15.0
            adult.centerY == young.centerY
            
            elder.width   == elderWidth
            elder.left    == adult.right + 15.0
            elder.centerY == young.centerY
        }
        
        self.addGestureRecognizersToRadioButtons()
        
        // Hide keyboard if user taps outside text fields
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: "endEditing:"))
    }
    
    // MARK: - Labels
    
    private let genderHeading    = ChoiceHeadingLabel(text: "Kön")
    private let labNameHeading   = ChoiceHeadingLabel(text: "Labbnamn")
    private let rebelNameHeading = ChoiceHeadingLabel(text: "Upprorsnamn (frivilligt)")
    private let ageGroupHeading  = ChoiceHeadingLabel(text: "Ålder")
    
    private lazy var genderInfoLabel: UILabel = {
        let genderInfoLabel = UILabel(frame: CGRectZero)
        genderInfoLabel.font = UIFont(name: "Colfax-RegularItalic", size: 12.0)
        genderInfoLabel.text = "Kön gör ingen som helst regelteknisk skillnad."
        genderInfoLabel.textAlignment = .Center
        
        return genderInfoLabel
    }()
    
    private lazy var labNameInfoLabel: UILabel = {
        let labNameInfoLabel = UILabel(frame: CGRectZero)
        if let animalType = self.character.djurtyp {
            labNameInfoLabel.text = animalType.namingConventionText()
        }
        labNameInfoLabel.numberOfLines = 0
        
        return labNameInfoLabel
    }()
    
    private lazy var rebelNameInfoLabel: UILabel = {
        let rebelNameInfoLabel = UILabel(frame: CGRectZero)
        rebelNameInfoLabel.text = "I det gryende Upprorets kretsar avfärdas de traditionella labbnamnen som “slavnamn”. I hemlighet tar sig Upprorets anhängare “upprorsnamn”, som oftast bygger på någon personlig egenskap."
        rebelNameInfoLabel.numberOfLines = 0
        
        return rebelNameInfoLabel
    }()
    
    // MARK: Radio buttons
    
    private let XYRadioButton = RadioButtonView(text: "Hane")
    private let XXRadioButton = RadioButtonView(text: "Hona")
    
    private let youngRadioButton = RadioButtonView(text: "Ungdjur")
    private let adultRadioButton = RadioButtonView(text: "Mogen")
    private let elderRadioButton = RadioButtonView(text: "Äldre")
    
    // MARK: Text fields & Picker views
    
    private lazy var labNameTextField: ChoiceTextField = {
        let labNameTextField = ChoiceTextField(frame: CGRectZero)
        labNameTextField.inputView = self.labNamePickerView
        labNameTextField.delegate = self
        
        return labNameTextField
    }()
    
    private lazy var rebelNameTextField: ChoiceTextField = {
        let rebelNameTextField = ChoiceTextField(frame: CGRectZero)
        rebelNameTextField.inputView = self.rebelNamePickerView
        rebelNameTextField.delegate = self
        
        rebelNameTextField.text = self.rebelNames.first
        
        return rebelNameTextField
    }()
    
    private lazy var labNamePickerView: UIPickerView = {
        let labNamePickerView = UIPickerView(frame: CGRectZero)
        labNamePickerView.backgroundColor = UIColor("f8f8f8")
        labNamePickerView.dataSource = self
        labNamePickerView.delegate = self
        
        return labNamePickerView
    }()
    
    private lazy var rebelNamePickerView: UIPickerView = {
        let rebelNamePickerView = UIPickerView(frame: CGRectZero)
        rebelNamePickerView.backgroundColor = UIColor("f8f8f8")
        rebelNamePickerView.dataSource = self
        rebelNamePickerView.delegate = self
        
        return rebelNamePickerView
    }()
    
    // MARK: - Methods
    
    func chooseButtonPressed(sender: UIBarButtonItem) {
        UIAlertView(title: "Not implemented yet", message: "Did press choose button.", delegate: nil, cancelButtonTitle: "Stäng").show()
    }
    
    func genderButtonTapped(sender: UITapGestureRecognizer?) {
        if let tappedRadioButton = sender?.view as? RadioButtonView {
            self.XYRadioButton.selected = false
            self.XXRadioButton.selected = false
            
            tappedRadioButton.selected = true
            
            self.navigationItem.rightBarButtonItem!.enabled = self.allMandatoryInformationProvided()
        }
    }
    
    func ageButtonTapped(sender: UITapGestureRecognizer?) {
        if let tappedRadioButton = sender?.view as? RadioButtonView {
            self.youngRadioButton.selected = false
            self.adultRadioButton.selected = false
            self.elderRadioButton.selected = false
            
            tappedRadioButton.selected = true
            
            self.navigationItem.rightBarButtonItem!.enabled = self.allMandatoryInformationProvided()
        }
    }
    
    private func allMandatoryInformationProvided() -> Bool {
        guard self.labNameTextField.text != nil else { return false }
        
        let genderChosen  = self.XYRadioButton.selected == true || self.XXRadioButton.selected == true
        let labNameChosen = self.labNameTextField.text!.characters.count > 0
        let ageChosen     = self.youngRadioButton.selected == true || self.adultRadioButton.selected == true || self.elderRadioButton.selected == true
        
        return genderChosen && labNameChosen && ageChosen
    }
    
    private func populateContentView() {
        self.contentView.addSubview(self.genderHeading)
        self.contentView.addSubview(self.XYRadioButton)
        self.contentView.addSubview(self.XXRadioButton)
        self.contentView.addSubview(self.genderInfoLabel)
        
        self.contentView.addSubview(self.labNameHeading)
        self.contentView.addSubview(self.labNameInfoLabel)
        self.contentView.addSubview(self.labNameTextField)
        
        self.contentView.addSubview(self.rebelNameHeading)
        self.contentView.addSubview(self.rebelNameInfoLabel)
        self.contentView.addSubview(self.rebelNameTextField)
        
        self.contentView.addSubview(self.ageGroupHeading)
        self.contentView.addSubview(self.youngRadioButton)
        self.contentView.addSubview(self.adultRadioButton)
        self.contentView.addSubview(self.elderRadioButton)
    }
    
    private func addGestureRecognizersToRadioButtons() {
        self.XYRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "genderButtonTapped:"))
        self.XXRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "genderButtonTapped:"))
        
        self.youngRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "ageButtonTapped:"))
        self.adultRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "ageButtonTapped:"))
        self.elderRadioButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "ageButtonTapped:"))
    }
    
    // MARK: - Properties
    
    private lazy var labNames: [String] = { return self.character.djurtyp!.exampleNames() }()
    
    private let rebelNames = ["Inget upprorsnamn", "Stortass", "Grönöga", "Snabbtass", "Stor-Klo", "Strävragg", "Fläckpäls"]
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField === self.labNameTextField && self.labNameTextField.text!.isEmpty {
            self.labNameTextField.text = self.labNames.first
        }
        self.navigationItem.rightBarButtonItem!.enabled = self.allMandatoryInformationProvided()
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView === self.labNamePickerView ? self.labNames[row] : self.rebelNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView === self.labNamePickerView {
            self.labNameTextField.text = self.labNames[row]
        } else {
            self.rebelNameTextField.text = self.rebelNames[row]
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView === self.labNamePickerView ? self.labNames.count : self.rebelNames.count
    }
}
