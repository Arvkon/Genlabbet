import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupAppAppearance()
        
        setupRootViewController()
        
        return true
    }
    
    fileprivate func setupAppAppearance() {
        window!.backgroundColor = .white
        
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
    
    fileprivate func setupRootViewController() {
        let characterListViewController = CharacterListViewController()
        let navigationController = UINavigationController(rootViewController: characterListViewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
    }
}
