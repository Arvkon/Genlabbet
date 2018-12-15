import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupAppAppearance()
        
        setupRootViewController()
        
        return true
    }
    
    fileprivate func setupAppAppearance() {
        window!.backgroundColor = .white
        
        // Navigation bar title
        if let titleFont = UIFont(name: "Colfax-Regular", size: 17.0) {
            let attributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): titleFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.black]
            UINavigationBar.appearance().titleTextAttributes = convertToOptionalNSAttributedStringKeyDictionary(attributes)
        }
        
        // Back button image
        let backButtonImage = UIImage(named: "NavbarBackButton")!.withRenderingMode(.alwaysOriginal)
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
    }
    
    fileprivate func setupRootViewController() {
        let characterListViewController = CharacterListViewController()
        let navigationController = UINavigationController(rootViewController: characterListViewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
