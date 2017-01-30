import UIKit
import Cartography
import PSTAlertController

class AnimalViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Djurtyp och art"
        
        let closeButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 18.0, height: 18.0))
        closeButton.setImage(UIImage(named: "NavbarCloseButton"), for: .normal)
        closeButton.addTarget(self, action: .closeButtonTapped, for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeButton)
        
        // Layout
        
        populateContentView()
        
        let optionViewWidth  = CGFloat(100.0)
        let optionViewHeight = optionViewWidth + AnimalTypeOptionView.labelHeight
        let verticalSpacing  = CGFloat(15.0)
        let horizontalOffset = CGFloat(20.0)
        
        constrain(primateOptionView, ursidaeOptionView) { primate, ursidae in
            primate.width  == optionViewWidth
            primate.height == optionViewHeight
            primate.right  == primate.superview!.centerX - horizontalOffset
            primate.top    == primate.superview!.top + verticalSpacing
            
            ursidae.width  == optionViewWidth
            ursidae.height == optionViewHeight
            ursidae.left   == ursidae.superview!.centerX + horizontalOffset
            ursidae.top    == primate.top
        }
        
        constrain(ursidaeOptionView, rodentiaOptionView, leporidaeOptionView) { ursidae, rodentia, leporidae in
            rodentia.width  == optionViewWidth
            rodentia.height == optionViewHeight
            rodentia.right  == rodentia.superview!.centerX - horizontalOffset
            rodentia.top    == ursidae.bottom + verticalSpacing
            
            leporidae.width  == optionViewWidth
            leporidae.height == optionViewHeight
            leporidae.left   == leporidae.superview!.centerX + horizontalOffset
            leporidae.top    == rodentia.top
        }
        
        constrain(leporidaeOptionView, canidaeOptionView, felidaeOptionView) { leporidae, canidae, felidae in
            canidae.width  == optionViewWidth
            canidae.height == optionViewHeight
            canidae.right  == canidae.superview!.centerX - horizontalOffset
            canidae.top    == leporidae.bottom + verticalSpacing
            
            felidae.width  == optionViewWidth
            felidae.height == optionViewHeight
            felidae.left   == felidae.superview!.centerX + horizontalOffset
            felidae.top    == canidae.top
        }
        
        constrain(felidaeOptionView, mustelidaeOptionView, reptiliaOptionView) { felidae, mustelidae, reptilia in
            mustelidae.width  == optionViewWidth
            mustelidae.height == optionViewHeight
            mustelidae.right  == mustelidae.superview!.centerX - horizontalOffset
            mustelidae.top    == felidae.bottom + verticalSpacing
            
            reptilia.width  == optionViewWidth
            reptilia.height == optionViewHeight
            reptilia.left   == reptilia.superview!.centerX + horizontalOffset
            reptilia.top    == mustelidae.top
        }
        
        contentView.layoutIfNeeded()
        
        contentView.contentSize = contentView.totalContentSize(addedHeight: 20.0)
        
        addGestureRecognizersToOptionViews()
    }
    
    // MARK: - Views
    
    fileprivate let primateOptionView    = AnimalTypeOptionView(animalType: .apa)
    fileprivate let ursidaeOptionView    = AnimalTypeOptionView(animalType: .björn)
    fileprivate let rodentiaOptionView   = AnimalTypeOptionView(animalType: .gnagare)
    fileprivate let leporidaeOptionView  = AnimalTypeOptionView(animalType: .hardjur)
    fileprivate let canidaeOptionView    = AnimalTypeOptionView(animalType: .hunddjur)
    fileprivate let felidaeOptionView    = AnimalTypeOptionView(animalType: .kattdjur)
    fileprivate let mustelidaeOptionView = AnimalTypeOptionView(animalType: .mårddjur)
    fileprivate let reptiliaOptionView   = AnimalTypeOptionView(animalType: .reptil)
    
    // MARK: - Methods
    
    func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func optionViewTapped(_ sender: UITapGestureRecognizer) {
        guard let optionView = sender.view as? AnimalTypeOptionView else { return }
        
        optionView.select()
        
        let actionSheet = PSTAlertController(title: nil, message: "Välj art", preferredStyle: .actionSheet)
        let deselectAction = { (action: PSTAlertAction!) -> Void in optionView.deselect() }
        actionSheet.addAction(PSTAlertAction(title: "Välj annan djurtyp", style: .cancel, handler: deselectAction))
        
        // Helper function
        func createPSTAlertActionForSpecies(_ species: Species) -> PSTAlertAction {
            return PSTAlertAction(title: species.string, style: .default) { (action: PSTAlertAction!) -> Void in
                self.character.art = species
                let viewController = RoleViewController(character: self.character)
                self.navigationController!.pushViewController(viewController, animated: true)
            }
        }
        
        switch optionView.animalType {
        case .apa:
            actionSheet.addAction(createPSTAlertActionForSpecies(.gorilla))
            actionSheet.addAction(createPSTAlertActionForSpecies(.orangutang))
            actionSheet.addAction(createPSTAlertActionForSpecies(.schimpans))
            
        case .björn:
            actionSheet.addAction(createPSTAlertActionForSpecies(.brunbjörn))
            actionSheet.addAction(createPSTAlertActionForSpecies(.tvättbjörn))
            
        case .gnagare:
            actionSheet.addAction(createPSTAlertActionForSpecies(.hamster))
            actionSheet.addAction(createPSTAlertActionForSpecies(.mus))
            actionSheet.addAction(createPSTAlertActionForSpecies(.råtta))
            actionSheet.addAction(createPSTAlertActionForSpecies(.sork))
            
        case .hardjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.hare))
            actionSheet.addAction(createPSTAlertActionForSpecies(.kanin))
            
        case .hunddjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.hund))
            actionSheet.addAction(createPSTAlertActionForSpecies(.räv))
            actionSheet.addAction(createPSTAlertActionForSpecies(.varg))
            
        case .kattdjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.katt))
            actionSheet.addAction(createPSTAlertActionForSpecies(.lodjur))
            
        case .mårddjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.grävling))
            actionSheet.addAction(createPSTAlertActionForSpecies(.järv))
            actionSheet.addAction(createPSTAlertActionForSpecies(.mård))
            actionSheet.addAction(createPSTAlertActionForSpecies(.vessla))
            
        case .reptil:
            actionSheet.addAction(createPSTAlertActionForSpecies(.groda))
            actionSheet.addAction(createPSTAlertActionForSpecies(.padda))
            actionSheet.addAction(createPSTAlertActionForSpecies(.sköldpadda))
            actionSheet.addAction(createPSTAlertActionForSpecies(.ödla))
        }
        
        actionSheet.showWithSender(nil, controller: self, animated: true, completion: nil)
    }
    
    fileprivate func populateContentView() {
        contentView.addSubview(primateOptionView)
        contentView.addSubview(ursidaeOptionView)
        contentView.addSubview(rodentiaOptionView)
        contentView.addSubview(leporidaeOptionView)
        contentView.addSubview(canidaeOptionView)
        contentView.addSubview(felidaeOptionView)
        contentView.addSubview(mustelidaeOptionView)
        contentView.addSubview(reptiliaOptionView)
    }
    
    fileprivate func addGestureRecognizersToOptionViews() {
        primateOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: .optionViewTapped))
        ursidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: .optionViewTapped))
        rodentiaOptionView.addGestureRecognizer(UITapGestureRecognizer(target:   self, action: .optionViewTapped))
        leporidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:  self, action: .optionViewTapped))
        canidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: .optionViewTapped))
        felidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: .optionViewTapped))
        mustelidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .optionViewTapped))
        reptiliaOptionView.addGestureRecognizer(UITapGestureRecognizer(target:   self, action: .optionViewTapped))
    }
}

private extension Selector {
    static let closeButtonTapped = #selector(AnimalViewController.closeButtonTapped(_:))
    static let optionViewTapped  = #selector(AnimalViewController.optionViewTapped(_:))
}
