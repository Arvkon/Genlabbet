import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Initiate Window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupAppAppearance()
        
        // Setup Root View Controller
        let characterListViewController = CharacterListViewController()
        let navigationController = UINavigationController(rootViewController: characterListViewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        return true
    }
    
    fileprivate func setupAppAppearance() {
        window!.backgroundColor = UIColor.white
        
        // Navigation bar title
        if let titleFont = UIFont(name: "Colfax-Regular", size: 17.0) {
            let attributes = [NSFontAttributeName: titleFont, NSForegroundColorAttributeName: UIColor.black]
            UINavigationBar.appearance().titleTextAttributes = attributes
        }
        
        // Back button image
        let backButtonImage = UIImage(named: "NavbarBackButton")!.withRenderingMode(.alwaysOriginal)
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
    }
}
