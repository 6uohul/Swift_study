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
//        tabBar.tintColor = UIColor.purple // TabBar Item 이 선택되었을때의 색
//        tabBar.unselectedItemTintColor = UIColor.black // TabBar Item 의 기본 색
        
        setUpTabBar()

    }

    private func setUpTabBar() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem.title = "Home" // TabBar Item 의 이름
        homeViewController.tabBarItem.image = UIImage(named: "HomeImage")
        
        let categoryViewController = UINavigationController(rootViewController: CategoryViewController())
        categoryViewController.tabBarItem.title = "카테고리"
        categoryViewController.tabBarItem.image = UIImage(named: "CategoryImage")
        
        let dailyDeliveryViewController = UINavigationController(rootViewController: DailyDeliveryViewController())
        dailyDeliveryViewController.tabBarItem.title = "하루배송"
        //dailyDeliveryViewController.tabBarItem.image = UIImage(named: "DailyDeliveryImage")
        
        let fanciedViewController = UINavigationController(rootViewController: FanciedViewController())
        fanciedViewController.tabBarItem.title = "찜"
        //fanciedViewController.tabBarItem.image = UIImage(named: "FanciedImage")
        
        let myPageViewController = UINavigationController(rootViewController: MyPageViewController())
        myPageViewController.tabBarItem.title = "마이페이지"
        //myPageViewController.tabBarItem.image = UIImage(named: "MyPageImage")
        
        viewControllers = [homeViewController,
                           categoryViewController,
                           dailyDeliveryViewController,
                           fanciedViewController,
                           myPageViewController]
    }
    
}
