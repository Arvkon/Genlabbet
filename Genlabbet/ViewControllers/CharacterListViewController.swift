import UIKit

class CharacterListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rollpersoner"
        
        view.addSubview(characterCollectionView)
    }
    
    // MARK: - Views
    
    fileprivate lazy var characterCollectionView: UICollectionView = {
        let verticalLayout = UICollectionViewFlowLayout()
        verticalLayout.scrollDirection = .vertical
        verticalLayout.minimumLineSpacing = 2.0 // Vertical spacing
        verticalLayout.minimumInteritemSpacing = 0.0 // Horizontal spacing
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: verticalLayout)
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(
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
        present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewDataSource
    
    fileprivate let numberOfItemsInList = 5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        
        if indexPath.row == numberOfItemsInList - 1 {
            cell.setLabelText("Skapa ny rollperson")
            cell.cellPressAction = {
                self.beginCharacterCreation()
            }
        } else {
            cell.setLabelText("Rollperson \(indexPath.row + 1)")
            cell.cellPressAction = {
                let message = "Did press character cell at index: \(indexPath.row)"
                UIAlertView(title: "Not implemented yet", message: message, delegate: nil, cancelButtonTitle: "Stäng").show()
            }
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 44.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? CharacterCollectionViewCell {
            selectedCell.performCellPressAction()
        }
    }
}
