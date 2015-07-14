import UIKit
import Cartography
import PSTAlertController

class AnimalViewController: CharacterCreationStepViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Djurtyp och art"
        
        let closeButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 18.0, height: 18.0))
        closeButton.setImage(UIImage(named: "NavbarCloseButton"), forState: .Normal)
        closeButton.addTarget(self, action: "closeButtonPressed:", forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeButton)
        
        // Layout
        
        self.populateContentView()
        
        let optionViewWidth  = Double(100.0)
        let optionViewHeight = optionViewWidth + AnimalTypeOptionView.labelHeight
        let verticalSpacing  = Double(15.0)
        let horizontalOffset = Double(20.0)
        
        layout(self.primateOptionView, self.ursidaeOptionView) { primate, ursidae in
            primate.width  == optionViewWidth
            primate.height == optionViewHeight
            primate.right  == primate.superview!.centerX - horizontalOffset
            primate.top    == primate.superview!.top + verticalSpacing
            
            ursidae.width  == optionViewWidth
            ursidae.height == optionViewHeight
            ursidae.left   == ursidae.superview!.centerX + horizontalOffset
            ursidae.top    == primate.top
        }
        
        layout(self.ursidaeOptionView, self.rodentiaOptionView, self.leporidaeOptionView) { ursidae, rodentia, leporidae in
            rodentia.width  == optionViewWidth
            rodentia.height == optionViewHeight
            rodentia.right  == rodentia.superview!.centerX - horizontalOffset
            rodentia.top    == ursidae.bottom + verticalSpacing
            
            leporidae.width  == optionViewWidth
            leporidae.height == optionViewHeight
            leporidae.left   == leporidae.superview!.centerX + horizontalOffset
            leporidae.top    == rodentia.top
        }
        
        layout(self.leporidaeOptionView, self.canidaeOptionView, self.felidaeOptionView) { leporidae, canidae, felidae in
            canidae.width  == optionViewWidth
            canidae.height == optionViewHeight
            canidae.right  == canidae.superview!.centerX - horizontalOffset
            canidae.top    == leporidae.bottom + verticalSpacing
            
            felidae.width  == optionViewWidth
            felidae.height == optionViewHeight
            felidae.left   == felidae.superview!.centerX + horizontalOffset
            felidae.top    == canidae.top
        }
        
        layout(self.felidaeOptionView, self.mustelidaeOptionView, self.reptiliaOptionView) { felidae, mustelidae, reptilia in
            mustelidae.width  == optionViewWidth
            mustelidae.height == optionViewHeight
            mustelidae.right  == mustelidae.superview!.centerX - horizontalOffset
            mustelidae.top    == felidae.bottom + verticalSpacing
            
            reptilia.width  == optionViewWidth
            reptilia.height == optionViewHeight
            reptilia.left   == reptilia.superview!.centerX + horizontalOffset
            reptilia.top    == mustelidae.top
        }
        
        self.contentView.contentSize = self.contentView.totalContentSize(addedHeight: 20.0)
        
        self.addGestureRecognizersToOptionViews()
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
    
    func closeButtonPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func optionViewTapped(sender: UITapGestureRecognizer) {
        if let optionView = sender.view as? AnimalTypeOptionView {
            optionView.select()
            
            let actionSheet = PSTAlertController(title: nil, message: "Välj art", preferredStyle: .ActionSheet)
            let deselectAction = { (action: PSTAlertAction!) -> Void in optionView.deselect() }
            actionSheet.addAction(PSTAlertAction(title: "Välj annan djurtyp", style: .Cancel, handler: deselectAction))
            
            // Helper function
            func createPSTAlertActionForSpecies(species: Species) -> PSTAlertAction {
                return PSTAlertAction(title: species.rawValue, style: .Default) { (action: PSTAlertAction!) -> Void in
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
    }
    
    private func populateContentView() {
        self.contentView.addSubview(self.primateOptionView)
        self.contentView.addSubview(self.ursidaeOptionView)
        self.contentView.addSubview(self.rodentiaOptionView)
        self.contentView.addSubview(self.leporidaeOptionView)
        self.contentView.addSubview(self.canidaeOptionView)
        self.contentView.addSubview(self.felidaeOptionView)
        self.contentView.addSubview(self.mustelidaeOptionView)
        self.contentView.addSubview(self.reptiliaOptionView)
    }
    
    private func addGestureRecognizersToOptionViews() {
        self.primateOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: "optionViewTapped:"))
        self.ursidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: "optionViewTapped:"))
        self.rodentiaOptionView.addGestureRecognizer(UITapGestureRecognizer(target:   self, action: "optionViewTapped:"))
        self.leporidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:  self, action: "optionViewTapped:"))
        self.canidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: "optionViewTapped:"))
        self.felidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target:    self, action: "optionViewTapped:"))
        self.mustelidaeOptionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "optionViewTapped:"))
        self.reptiliaOptionView.addGestureRecognizer(UITapGestureRecognizer(target:   self, action: "optionViewTapped:"))
    }
}
