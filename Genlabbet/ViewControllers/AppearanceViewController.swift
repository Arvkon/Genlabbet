import UIKit
import Cartography
import SwiftColor

class AppearanceViewController: CharacterCreationStepViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Utseende"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: "chooseButtonPressed:")
        self.navigationItem.rightBarButtonItem!.enabled = false
        
        self.skipCreationStepLabel.linkAction = { () -> Void in
            let viewController = GenderNameAgeViewController(character: self.character)
            self.navigationController!.pushViewController(viewController, animated: true)
        }
        
        // Layout
        
        self.contentView.addSubview(self.skipCreationStepLabel)
        self.contentView.addSubview(self.faceLabel)
        self.contentView.addSubview(self.bodyLabel)
        self.contentView.addSubview(self.wearLabel)
        self.contentView.addSubview(self.faceTextField)
        self.contentView.addSubview(self.bodyTextField)
        self.contentView.addSubview(self.wearTextField)
        
        let totalSideMargin = 30.0
        let labelTopSpacing = 15.0
        let fieldTopSpacing = 10.0
        
        layout(self.skipCreationStepLabel, self.faceLabel, self.faceTextField) { skipLabel, faceLabel, faceField in
            skipLabel.width   == skipLabel.superview!.width - totalSideMargin
            skipLabel.height  == 35.0
            skipLabel.top     == skipLabel.superview!.top + 10.0
            skipLabel.centerX == skipLabel.superview!.centerX
            
            faceLabel.width   == faceLabel.superview!.width - totalSideMargin
            faceLabel.top     == skipLabel.bottom + labelTopSpacing
            faceLabel.centerX == faceLabel.superview!.centerX
            
            faceField.width   == faceField.superview!.width - totalSideMargin
            faceField.top     == faceLabel.bottom + fieldTopSpacing
            faceField.centerX == faceField.superview!.centerX
        }
        
        layout(self.faceTextField, self.bodyLabel, self.bodyTextField) { faceField, bodyLabel, bodyField in
            bodyLabel.width   == bodyLabel.superview!.width - totalSideMargin
            bodyLabel.top     == faceField.bottom + labelTopSpacing
            bodyLabel.centerX == bodyLabel.superview!.centerX
            
            bodyField.width   == bodyField.superview!.width - totalSideMargin
            bodyField.top     == bodyLabel.bottom + fieldTopSpacing
            bodyField.centerX == bodyField.superview!.centerX
        }
        
        layout(self.bodyTextField, self.wearLabel, self.wearTextField) { bodyField, wearLabel, wearField in
            wearLabel.width   == wearLabel.superview!.width - totalSideMargin
            wearLabel.top     == bodyField.bottom + labelTopSpacing
            wearLabel.centerX == wearLabel.superview!.centerX
            
            wearField.width   == wearField.superview!.width - totalSideMargin
            wearField.top     == wearLabel.bottom + fieldTopSpacing
            wearField.centerX == wearField.superview!.centerX
        }
    }
    
    // MARK: - Views
    
    private let skipCreationStepLabel = SkipCreationStepLabel(frame: CGRectZero)
    
    // MARK: Heading labels
    
    private let faceLabel = ChoiceHeadingLabel(text: "Ansikte")
    private let bodyLabel = ChoiceHeadingLabel(text: "Kropp")
    private let wearLabel = ChoiceHeadingLabel(text: "Klädsel")
    
    // MARK: Text fields
    
    private lazy var faceTextField: ChoiceTextField = {
        let faceTextField = ChoiceTextField(frame: CGRectZero)
        faceTextField.inputView = self.facePickerView
        faceTextField.delegate = self
        
        return faceTextField
    }()
    
    private lazy var bodyTextField: ChoiceTextField = {
        let bodyTextField = ChoiceTextField(frame: CGRectZero)
        bodyTextField.inputView = self.bodyPickerView
        bodyTextField.delegate = self
        
        return bodyTextField
    }()
    
    private lazy var wearTextField: ChoiceTextField = {
        let wearTextField = ChoiceTextField(frame: CGRectZero)
        wearTextField.inputView = self.wearPickerView
        wearTextField.delegate = self
        
        return wearTextField
    }()
    
    // MARK: Picker views
    
    private lazy var facePickerView: UIPickerView = {
        let facePickerView = UIPickerView(frame: CGRectZero)
        facePickerView.backgroundColor = UIColor("f8f8f8")
        facePickerView.dataSource = self
        facePickerView.delegate = self
        
        return facePickerView
    }()
    
    private lazy var bodyPickerView: UIPickerView = {
        let bodyPickerView = UIPickerView(frame: CGRectZero)
        bodyPickerView.backgroundColor = UIColor("f8f8f8")
        bodyPickerView.dataSource = self
        bodyPickerView.delegate = self
        
        return bodyPickerView
    }()
    
    private lazy var wearPickerView: UIPickerView = {
        let wearPickerView = UIPickerView(frame: CGRectZero)
        wearPickerView.backgroundColor = UIColor("f8f8f8")
        wearPickerView.dataSource = self
        wearPickerView.delegate = self
        
        return wearPickerView
    }()
    
    // MARK: - Methods
    
    func chooseButtonPressed(sender: UIBarButtonItem) {
        self.character.ansikte = self.faceTextField.text
        self.character.kropp   = self.bodyTextField.text
        self.character.kläder  = self.wearTextField.text
        
        let viewController = GenderNameAgeViewController(character: self.character)
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    private func allTextFieldsContainText() -> Bool {
        let faceChosen = count(self.faceTextField.text) > 0
        let bodyChosen = count(self.bodyTextField.text) > 0
        let wearChosen = count(self.wearTextField.text) > 0
        
        return faceChosen && bodyChosen && wearChosen
    }
    
    // MARK: - Properties
    
    private lazy var faceOptions: [String] = { return self.character.syssla!.faceOptions() }()
    private lazy var bodyOptions: [String] = { return self.character.syssla!.bodyOptions() }()
    private lazy var wearOptions: [String] = { return self.character.syssla!.wearOptions() }()
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField === self.faceTextField && self.faceTextField.text.isEmpty {
            self.faceTextField.text = self.faceOptions.first
        } else if textField === self.bodyTextField && self.bodyTextField.text.isEmpty {
            self.bodyTextField.text = self.bodyOptions.first
        } else if textField === self.wearTextField && self.wearTextField.text.isEmpty {
            self.wearTextField.text = self.wearOptions.first
        }
        
        self.navigationItem.rightBarButtonItem!.enabled = self.allTextFieldsContainText()
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView === self.facePickerView {
            return self.faceOptions[row]
        } else if pickerView === self.bodyPickerView {
            return self.bodyOptions[row]
        } else {
            return self.wearOptions[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView === self.facePickerView {
            self.faceTextField.text = self.faceOptions[row]
        } else if pickerView === self.bodyPickerView {
            self.bodyTextField.text = self.bodyOptions[row]
        } else if pickerView === self.wearPickerView {
            self.wearTextField.text = self.wearOptions[row]
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView === self.facePickerView {
            return self.faceOptions.count
        } else if pickerView === self.bodyPickerView {
            return self.bodyOptions.count
        } else {
            return self.wearOptions.count
        }
    }
}
