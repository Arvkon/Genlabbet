import UIKit

class CharacterListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Rollpersoner"
        
        self.view.addSubview(self.characterCollectionView)
    }
    
    // MARK: - Views
    
    private lazy var characterCollectionView: UICollectionView = {
        let verticalLayout = UICollectionViewFlowLayout()
        verticalLayout.scrollDirection = .Vertical
        verticalLayout.minimumLineSpacing = 2.0 // Vertical spacing
        verticalLayout.minimumInteritemSpacing = 0.0 // Horizontal spacing
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: verticalLayout)
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerClass(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: "CharacterCollectionViewCell"
        )
        
        return collectionView
    }()
    
    // MARK: - Methods
    
    func beginCharacterCreation() {
        let animalViewController = AnimalViewController(character: Character())
        //let animalViewController = RoleViewController(character: Character())
        let navigationController = UINavigationController(rootViewController: animalViewController)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewDataSource
    
    private let numberOfItemsInList = 5
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInList
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CharacterCollectionViewCell", forIndexPath: indexPath) as! CharacterCollectionViewCell
        
        if indexPath.row == self.numberOfItemsInList - 1 {
            cell.setLabelText("Skapa ny rollperson")
            cell.cellPressAction = { () -> Void in
                self.beginCharacterCreation()
            }
        } else {
            cell.setLabelText("Rollperson \(indexPath.row + 1)")
            cell.cellPressAction = { () -> Void in
                let message = "Did press character cell at index: \(indexPath.row)"
                UIAlertView(title: "Not implemented yet", message: message, delegate: nil, cancelButtonTitle: "Stäng").show()
            }
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 44.0)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        if let selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as? CharacterCollectionViewCell {
            selectedCell.performCellPressAction()
        }
    }
}
