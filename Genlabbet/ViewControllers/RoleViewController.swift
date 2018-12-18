import UIKit
import Cartography

class RoleViewController: CharacterCreationStepViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Syssla"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Välj", style: .plain, target: self, action: .chooseButtonTapped)
        
        // Layout
        
        contentView.addSubview(pageControl)
        contentView.addSubview(pageViewController.view)
        
        let statusBarHeight   = UIApplication.shared.statusBarFrame.height
        let navigationHeight  = navigationController!.navigationBar.frame.height
        let progressBarHeight = progressBar.frame.height
        
        let combinedBarHeight = CGFloat(statusBarHeight + navigationHeight + progressBarHeight)
        let pageControlHeight = CGFloat(30.0)
        let pageDisplayHeight = CGFloat(view.frame.height) - combinedBarHeight - pageControlHeight
        
        constrain(pageControl, pageViewController.view) { pageControl, pageDisplay in
            pageControl.width   == pageControl.superview!.width
            pageControl.height  == pageControlHeight
            pageControl.top     == pageControl.superview!.top
            pageControl.centerX == pageControl.superview!.centerX
            
            pageDisplay.width   == pageDisplay.superview!.width
            pageDisplay.height  == pageDisplayHeight
            pageDisplay.top     == pageControl.bottom
            pageDisplay.centerX == pageDisplay.superview!.centerX
        }
        
        contentView.isScrollEnabled = false
    }
    
    // MARK: - Views
    
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect.zero)
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        pageControl.backgroundColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        return pageControl
    }()
    
    // MARK: - Properties
    
    fileprivate lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.setViewControllers([self.viewControllerAtIndex(0)!], direction: .forward, animated: false, completion: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        self.addChildViewController(pageViewController)
        pageViewController.didMove(toParentViewController: self)
        
        return pageViewController
    }()
    
    // MARK: - Methods
    
    func chooseButtonTapped(_ sender: UIBarButtonItem) {
        character.syssla = viewControllerAtIndex(pageControl.currentPage)!.role
        let viewController = AppearanceViewController(character: character)
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    fileprivate func viewControllerAtIndex(_ index: Int) -> RolePageContentViewController? {
        if index < Role.allValues.count {
            return RolePageContentViewController(role: Role.allValues[index], pageIndex: index)
        } else {
            return nil
        }
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageIndex = (viewController as! RolePageContentViewController).pageIndex
        return pageIndex == 0 ? nil : viewControllerAtIndex(pageIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageIndex = (viewController as! RolePageContentViewController).pageIndex
        return pageIndex == Role.allValues.count ? nil : viewControllerAtIndex(pageIndex + 1)
    }
    
    // MARK: - UIPageViewControllerDelegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentViewController = pageViewController.viewControllers?.first as? RolePageContentViewController {
            pageControl.currentPage = currentViewController.pageIndex
        }
    }
}

private extension Selector {
    static let chooseButtonTapped = #selector(RoleViewController.chooseButtonTapped(_:))
}
