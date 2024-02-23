//
//  ViewController.swift
//  Practice_PageVC
//
//  Created by 김인영 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {

    private var viewControllerList: [ViewController] = []
    
    private let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = .white
        $0.pageIndicatorTintColor = .white.withAlphaComponent(0.3)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageVC.delegate = self
        pageVC.dataSource = self
    }
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let index = pageViewController.viewControllers?.first?.view.tag else { return nil }
       
        let previousIndex = index - 1
        
        if previousIndex < 0 || viewControllerList.count <= previousIndex {
            return nil
        }
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = pageViewController.viewControllers?.first?.view.tag else { return nil }
       
        let nextIndex = index + 1
        
        if viewControllerList.count <= nextIndex {
            return nil
        }
        
        return viewControllerList[nextIndex]
    }
    
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
       guard completed else { return }
       
       if let vc = pageViewController.viewControllers?.first {
           pageControl.currentPage = vc.view.tag
       }
    }
    
}

