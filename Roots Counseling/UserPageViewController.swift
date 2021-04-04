//
//  UserPageViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/20/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit

class UserPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var user = ""
    var week = ""
    
    lazy var orderedViewControllers: [UIViewController] = {
        var mon = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Monday") as! UserDayViewController
        mon.user = user
        mon.week = week
        var tue = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Tuesday") as! UserDayViewController
        tue.user = user
        tue.week = week
        var wed = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Wednesday") as! UserDayViewController
        wed.user = user
        wed.week = week
        var thu = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Thursday") as! UserDayViewController
        thu.user = user
        thu.week = week
        var fri = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Friday") as! UserDayViewController
        fri.user = user
        fri.week = week
        var sat = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Saturday") as! UserDayViewController
        sat.user = user
        sat.week = week
        var sun = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Sunday") as! UserDayViewController
        sun.user = user
        sun.week = week
        
        return [mon,tue,wed,thu,fri,sat,sun]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                direction: .forward,
                animated: true,
                completion: nil)
        }
        
        delegate = self
        configurePageControl()
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            // User is on the first view controller and swiped left to loop to
            // the last view controller.
            guard previousIndex >= 0 else {
                return orderedViewControllers.last
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            // User is on the last view controller and swiped right to loop to
            // the first view controller.
            guard orderedViewControllersCount != nextIndex else {
                return orderedViewControllers.first
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
}
