import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Initiate Window
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Setup General Appearance
        self.window!.backgroundColor = UIColor.whiteColor()
        if let titleFont = UIFont(name: "Colfax-Regular", size: 17.0) {
            let attributes = [NSFontAttributeName: titleFont, NSForegroundColorAttributeName: UIColor.blackColor()]
            UINavigationBar.appearance().titleTextAttributes = attributes
        }
        
        // Setup Root View Controller
        let characterListViewController = CharacterListViewController()
        let navigationController = UINavigationController(rootViewController: characterListViewController)
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}
