import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Initiate Window
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Setup General Appearance
        self.window!.backgroundColor = UIColor.whiteColor()
        
        // Setup Root View Controller
        let characterListViewController = CharacterListViewController()
        self.window!.rootViewController = characterListViewController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}
