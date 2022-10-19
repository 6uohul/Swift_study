//
//  TabBarViewController.swift
//  ClothesRecommend_Brandi
//
//  Created by 김인영 on 2022/10/20.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.white // TabBar 의 배경 색
        tabBar.tintColor = UIColor.purple // TabBar Item 이 선택되었을때의 색
        tabBar.unselectedItemTintColor = UIColor.black // TabBar Item 의 기본 색
        
        setUpTabBar()

    }

    private func setUpTabBar() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem.title = "Home" // TabBar Item 의 이름
        
        let secondViewController = UINavigationController(rootViewController: SecondViewController())
        secondViewController.tabBarItem.title = "Second"
        
        let thirdViewController = UINavigationController(rootViewController: ThirdViewController())
        thirdViewController.tabBarItem.title = "Third"
        
        let fourthViewController = UINavigationController(rootViewController: FourthViewController())
        fourthViewController.tabBarItem.title = "Fourth"
        
        let fifthViewController = UINavigationController(rootViewController: FifthViewController())
        fifthViewController.tabBarItem.title = "Fifth"
        
        viewControllers = [homeViewController,
                           secondViewController,
                           thirdViewController,
                           fourthViewController,
                           fifthViewController]
    }
    
}
