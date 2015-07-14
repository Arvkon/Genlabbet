import UIKit
import Cartography

class RoleViewController: CharacterCreationStepViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Syssla"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .Plain, target: self, action: "chooseButtonPressed:")
        
        // Layout
        
        self.contentView.addSubview(self.pageControl)
        self.contentView.addSubview(self.pageViewController.view)
        
        let statusBarHeight   = UIApplication.sharedApplication().statusBarFrame.height
        let navigationHeight  = self.navigationController!.navigationBar.frame.height
        let progressBarHeight = self.progressBar.frame.height
        
        let combinedBarHeight = Double(statusBarHeight + navigationHeight + progressBarHeight)
        let pageControlHeight = Double(30.0)
        let pageDisplayHeight = Double(self.view.frame.height) - combinedBarHeight - pageControlHeight
        
        layout(self.pageControl, self.pageViewController.view) { pageControl, pageDisplay in
            pageControl.width   == pageControl.superview!.width
            pageControl.height  == pageControlHeight
            pageControl.top     == pageControl.superview!.top
            pageControl.centerX == pageControl.superview!.centerX
            
            pageDisplay.width   == pageDisplay.superview!.width
            pageDisplay.height  == pageDisplayHeight
            pageDisplay.top     == pageControl.bottom
            pageDisplay.centerX == pageDisplay.superview!.centerX
        }
        
        self.contentView.scrollEnabled = false
    }
    
    // MARK: - Views
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRectZero)
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
        
        pageControl.backgroundColor = UIColor.whiteColor()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        
        return pageControl
    }()
    
    // MARK: - Properties
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.setViewControllers([self.viewControllerAtIndex(0)!], direction: .Forward, animated: false, completion: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        self.addChildViewController(pageViewController)
        pageViewController.didMoveToParentViewController(self)
        
        return pageViewController
    }()
    
    // MARK: - Methods
    
    func chooseButtonPressed(sender: UIBarButtonItem) {
        UIAlertView(title: "Not implemented yet", message: "Did press choose button.", delegate: nil, cancelButtonTitle: "Stäng").show()
    }
    
    private func viewControllerAtIndex(index: Int) -> RolePageContentViewController? {
        if index < Role.allMembers.count {
            return RolePageContentViewController(role: Role.allMembers[index], pageIndex: index)
        } else {
            return nil
        }
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let pageIndex = (viewController as! RolePageContentViewController).pageIndex
        return pageIndex == 0 ? nil : viewControllerAtIndex(pageIndex - 1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let pageIndex = (viewController as! RolePageContentViewController).pageIndex
        return pageIndex == Role.allMembers.count ? nil : viewControllerAtIndex(pageIndex + 1)
    }
    
    // MARK: - UIPageViewControllerDelegate
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool) {
        if let currentViewController = pageViewController.viewControllers[0] as? RolePageContentViewController {
            self.pageControl.currentPage = currentViewController.pageIndex
        }
    }
}
