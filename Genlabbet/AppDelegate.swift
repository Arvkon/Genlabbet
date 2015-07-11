import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Initiate Window
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.setupAppAppearance()
        
        // Setup Root View Controller
        let characterListViewController = CharacterListViewController()
        let navigationController = UINavigationController(rootViewController: characterListViewController)
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    private func setupAppAppearance() {
        self.window!.backgroundColor = UIColor.whiteColor()
        
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
