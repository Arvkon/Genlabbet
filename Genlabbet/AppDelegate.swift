import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Initiate Window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        setupAppAppearance()
        
        // Setup Root View Controller
        let characterListViewController = CharacterListViewController()
        let navigationController = UINavigationController(rootViewController: characterListViewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        return true
    }
    
    private func setupAppAppearance() {
        window!.backgroundColor = UIColor.whiteColor()
        
        // Navigation bar title
        if let titleFont = UIFont(name: "Colfax-Regular", size: 17.0) {
            let attributes = [NSFontAttributeName: titleFont, NSForegroundColorAttributeName: UIColor.blackColor()]
            UINavigationBar.appearance().titleTextAttributes = attributes
        }
        
        // Back button image
        let backButtonImage = UIImage(named: "NavbarBackButton")!.imageWithRenderingMode(.AlwaysOriginal)
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
    }
}
