import UIKit
import Cartography
import PSTAlertController

class AnimalViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Djurtyp och art"
        
        let closeButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 18.0, height: 18.0))
        closeButton.setImage(UIImage(named: "NavbarCloseButton"), forState: .Normal)
        closeButton.addTarget(self, action: .closeButtonTapped, forControlEvents: .TouchUpInside)
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
    
    private let primateOptionView    = AnimalTypeOptionView(animalType: .Apa)
    private let ursidaeOptionView    = AnimalTypeOptionView(animalType: .Björn)
    private let rodentiaOptionView   = AnimalTypeOptionView(animalType: .Gnagare)
    private let leporidaeOptionView  = AnimalTypeOptionView(animalType: .Hardjur)
    private let canidaeOptionView    = AnimalTypeOptionView(animalType: .Hunddjur)
    private let felidaeOptionView    = AnimalTypeOptionView(animalType: .Kattdjur)
    private let mustelidaeOptionView = AnimalTypeOptionView(animalType: .Mårddjur)
    private let reptiliaOptionView   = AnimalTypeOptionView(animalType: .Reptil)
    
    // MARK: - Methods
    
    func closeButtonTapped(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func optionViewTapped(sender: UITapGestureRecognizer) {
        guard let optionView = sender.view as? AnimalTypeOptionView else { return }
        
        optionView.select()
        
        let actionSheet = PSTAlertController(title: nil, message: "Välj art", preferredStyle: .ActionSheet)
        let deselectAction = { (action: PSTAlertAction!) -> Void in optionView.deselect() }
        actionSheet.addAction(PSTAlertAction(title: "Välj annan djurtyp", style: .Cancel, handler: deselectAction))
        
        // Helper function
        func createPSTAlertActionForSpecies(species: Species) -> PSTAlertAction {
            return PSTAlertAction(title: species.string, style: .Default) { (action: PSTAlertAction!) -> Void in
                self.character.art = species
                let viewController = RoleViewController(character: self.character)
                self.navigationController!.pushViewController(viewController, animated: true)
            }
        }
        
        switch optionView.animalType {
        case .Apa:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Gorilla))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Orangutang))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Schimpans))
            
        case .Björn:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Brunbjörn))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Tvättbjörn))
            
        case .Gnagare:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Hamster))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Mus))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Råtta))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Sork))
            
        case .Hardjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Hare))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Kanin))
            
        case .Hunddjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Hund))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Räv))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Varg))
            
        case .Kattdjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Katt))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Lodjur))
            
        case .Mårddjur:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Grävling))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Järv))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Mård))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Vessla))
            
        case .Reptil:
            actionSheet.addAction(createPSTAlertActionForSpecies(.Groda))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Padda))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Sköldpadda))
            actionSheet.addAction(createPSTAlertActionForSpecies(.Ödla))
        }
        
        actionSheet.showWithSender(nil, controller: self, animated: true, completion: nil)
    }
    
    private func populateContentView() {
        contentView.addSubview(primateOptionView)
        contentView.addSubview(ursidaeOptionView)
        contentView.addSubview(rodentiaOptionView)
        contentView.addSubview(leporidaeOptionView)
        contentView.addSubview(canidaeOptionView)
        contentView.addSubview(felidaeOptionView)
        contentView.addSubview(mustelidaeOptionView)
        contentView.addSubview(reptiliaOptionView)
    }
    
    private func addGestureRecognizersToOptionViews() {
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
