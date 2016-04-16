import UIKit
import Cartography
import SwiftColor

class AppearanceViewController: CharacterCreationStepViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Utseende"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: .chooseButtonTapped)
        navigationItem.rightBarButtonItem!.enabled = false
        
        skipCreationStepLabel.linkAction = { () -> Void in
            let viewController = GenderNameAgeViewController(character: self.character)
            self.navigationController!.pushViewController(viewController, animated: true)
        }
        
        // Layout
        
        contentView.addSubview(skipCreationStepLabel)
        contentView.addSubview(faceLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(wearLabel)
        contentView.addSubview(faceTextField)
        contentView.addSubview(bodyTextField)
        contentView.addSubview(wearTextField)
        
        let labelTopSpacing = 15.0 as CGFloat
        let fieldTopSpacing = 10.0 as CGFloat
        
        constrain(skipCreationStepLabel, faceLabel, faceTextField) { skipLabel, faceLabel, faceField in
            skipLabel.width   == skipLabel.superview!.width - TotalSideMargin
            skipLabel.height  == 35.0
            skipLabel.top     == skipLabel.superview!.top + 10.0
            skipLabel.centerX == skipLabel.superview!.centerX
            
            faceLabel.width   == faceLabel.superview!.width - TotalSideMargin
            faceLabel.top     == skipLabel.bottom + labelTopSpacing
            faceLabel.centerX == faceLabel.superview!.centerX
            
            faceField.width   == faceField.superview!.width - TotalSideMargin
            faceField.top     == faceLabel.bottom + fieldTopSpacing
            faceField.centerX == faceField.superview!.centerX
        }
        
        constrain(faceTextField, bodyLabel, bodyTextField) { faceField, bodyLabel, bodyField in
            bodyLabel.width   == bodyLabel.superview!.width - TotalSideMargin
            bodyLabel.top     == faceField.bottom + labelTopSpacing
            bodyLabel.centerX == bodyLabel.superview!.centerX
            
            bodyField.width   == bodyField.superview!.width - TotalSideMargin
            bodyField.top     == bodyLabel.bottom + fieldTopSpacing
            bodyField.centerX == bodyField.superview!.centerX
        }
        
        constrain(bodyTextField, wearLabel, wearTextField) { bodyField, wearLabel, wearField in
            wearLabel.width   == wearLabel.superview!.width - TotalSideMargin
            wearLabel.top     == bodyField.bottom + labelTopSpacing
            wearLabel.centerX == wearLabel.superview!.centerX
            
            wearField.width   == wearField.superview!.width - TotalSideMargin
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
    
    func chooseButtonTapped(sender: UIBarButtonItem) {
        character.ansikte = faceTextField.text
        character.kropp   = bodyTextField.text
        character.kläder  = wearTextField.text
        
        let viewController = GenderNameAgeViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    private func allTextFieldsContainText() -> Bool {
        guard let faceText = faceTextField.text else { return false }
        guard let bodyText = bodyTextField.text else { return false }
        guard let wearText = wearTextField.text else { return false }
        
        let faceChosen = faceText.characters.count > 0
        let bodyChosen = bodyText.characters.count > 0
        let wearChosen = wearText.characters.count > 0
        
        return faceChosen && bodyChosen && wearChosen
    }
    
    // MARK: - Properties
    
    private lazy var faceOptions: [String] = { return self.character.syssla!.faceOptions() }()
    private lazy var bodyOptions: [String] = { return self.character.syssla!.bodyOptions() }()
    private lazy var wearOptions: [String] = { return self.character.syssla!.wearOptions() }()
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField === faceTextField && faceTextField.text!.isEmpty {
            faceTextField.text = faceOptions.first
        } else if textField === bodyTextField && bodyTextField.text!.isEmpty {
            bodyTextField.text = bodyOptions.first
        } else if textField === wearTextField && wearTextField.text!.isEmpty {
            wearTextField.text = wearOptions.first
        }
        
        navigationItem.rightBarButtonItem!.enabled = allTextFieldsContainText()
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView === facePickerView {
            return faceOptions[row]
        } else if pickerView === bodyPickerView {
            return bodyOptions[row]
        } else {
            return wearOptions[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView === facePickerView {
            faceTextField.text = faceOptions[row]
        } else if pickerView === bodyPickerView {
            bodyTextField.text = bodyOptions[row]
        } else if pickerView === wearPickerView {
            wearTextField.text = wearOptions[row]
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView === facePickerView {
            return faceOptions.count
        } else if pickerView === bodyPickerView {
            return bodyOptions.count
        } else {
            return wearOptions.count
        }
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(AppearanceViewController.chooseButtonTapped(_:))
}
