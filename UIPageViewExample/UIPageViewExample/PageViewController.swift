//
//  PageViewController.swift
//  UIPageViewExample
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private lazy var orderedViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController1") as! ViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        setViewControllers([orderedViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func nextPage() {
        guard let currentVC = self.viewControllers?.first else { return }
        guard let nextVC = dataSource?.pageViewController(self, viewControllerAfter: currentVC) else { return }
        setViewControllers([nextVC],
                           direction: UIPageViewController.NavigationDirection.forward,
                           animated: true,
                           completion: nil)
    }
    
    func previousPage() {
        guard let currentVC = self.viewControllers?.first else { return }
        guard let previousVC = dataSource?.pageViewController(self, viewControllerBefore: currentVC) else { return }
        setViewControllers([previousVC],
                           direction: UIPageViewController.NavigationDirection.reverse,
                           animated: true,
                           completion: nil)
    }
    func skipPage() {
        guard let lastVC = orderedViewControllers.last else { return }
        setViewControllers([lastVC],
                           direction: UIPageViewController.NavigationDirection.forward,
                           animated: true,
                           completion: nil)
    }

}
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1

//        guard nextIndex < orderedViewControllers.count else { return orderedViewControllers.first }

        guard orderedViewControllers.count > nextIndex else { return nil }

        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return nil
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }

        return orderedViewControllers[previousIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
