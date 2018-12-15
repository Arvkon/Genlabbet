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
    
    fileprivate let primateOptionView    = AnimalTypeOptionView(animalType: .ape)
    fileprivate let mustelidaeOptionView = AnimalTypeOptionView(animalType: .badger)
    fileprivate let ursidaeOptionView    = AnimalTypeOptionView(animalType: .bear)
    fileprivate let felidaeOptionView    = AnimalTypeOptionView(animalType: .cat)
    fileprivate let canidaeOptionView    = AnimalTypeOptionView(animalType: .dog)
    fileprivate let leporidaeOptionView  = AnimalTypeOptionView(animalType: .rabbit)
    fileprivate let rodentiaOptionView   = AnimalTypeOptionView(animalType: .rat)
    fileprivate let reptiliaOptionView   = AnimalTypeOptionView(animalType: .reptile)
    
    // MARK: - Methods
    
    @objc func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func optionViewTapped(_ sender: UITapGestureRecognizer) {
        guard let optionView = sender.view as? AnimalTypeOptionView else { return }
        
        optionView.select()
        
        let actionSheet = PSTAlertController(title: nil, message: "Välj art", preferredStyle: .actionSheet)
        let deselectAction = { (action: PSTAlertAction!) in optionView.deselect() }
        actionSheet.addAction(PSTAlertAction(title: "Välj annan djurtyp", style: .cancel, handler: deselectAction))
        
        // Helper function
        func createPSTAlertActionForSpecies(_ species: Species) -> PSTAlertAction {
            return PSTAlertAction(title: species.string, style: .default) { action in
                self.character.species = species
                let viewController = RoleViewController(character: self.character)
                self.navigationController!.pushViewController(viewController, animated: true)
            }
        }
        
        switch optionView.animalType {
        case .ape:
            actionSheet.addAction(createPSTAlertActionForSpecies(.chimpanzee))
            actionSheet.addAction(createPSTAlertActionForSpecies(.gorilla))
            actionSheet.addAction(createPSTAlertActionForSpecies(.orangutan))

        case .badger:
            actionSheet.addAction(createPSTAlertActionForSpecies(.badger))
            actionSheet.addAction(createPSTAlertActionForSpecies(.marten))
            actionSheet.addAction(createPSTAlertActionForSpecies(.weasel))
            actionSheet.addAction(createPSTAlertActionForSpecies(.wolverine))

        case .bear:
            actionSheet.addAction(createPSTAlertActionForSpecies(.bear))
            actionSheet.addAction(createPSTAlertActionForSpecies(.raccoon))

        case .cat:
            actionSheet.addAction(createPSTAlertActionForSpecies(.cat))
            actionSheet.addAction(createPSTAlertActionForSpecies(.cougar))
            actionSheet.addAction(createPSTAlertActionForSpecies(.lynx))

        case .dog:
            actionSheet.addAction(createPSTAlertActionForSpecies(.dog))
            actionSheet.addAction(createPSTAlertActionForSpecies(.fox))
            actionSheet.addAction(createPSTAlertActionForSpecies(.wolf))

        case .rabbit:
            actionSheet.addAction(createPSTAlertActionForSpecies(.hare))
            actionSheet.addAction(createPSTAlertActionForSpecies(.rabbit))

        case .rat:
            actionSheet.addAction(createPSTAlertActionForSpecies(.hamster))
            actionSheet.addAction(createPSTAlertActionForSpecies(.mouse))
            actionSheet.addAction(createPSTAlertActionForSpecies(.rat))
            actionSheet.addAction(createPSTAlertActionForSpecies(.squirrel))
            actionSheet.addAction(createPSTAlertActionForSpecies(.vole))

        case .reptile:
            actionSheet.addAction(createPSTAlertActionForSpecies(.frog))
            actionSheet.addAction(createPSTAlertActionForSpecies(.lizard))
            actionSheet.addAction(createPSTAlertActionForSpecies(.toad))
            actionSheet.addAction(createPSTAlertActionForSpecies(.turtle))
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
