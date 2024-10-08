//
//  MainPageViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit

class MainPageViewController: UITabBarController {
    
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    // 네비게이션 방식 전환 구현 위해  MyViewController가 UINavigationController로 감싸줌.
    private let myVC = UINavigationController(rootViewController: MyViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        // 각각의 탭바들 생성
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        styleVC.title = "Style"
        styleVC.tabBarItem = UITabBarItem(title: "Style", image: UIImage(systemName: "heart.fill"), tag: 1)
                
        shopVC.title = "Shop"
        shopVC.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        savedVC.title = "Saved"
        savedVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "bookmark.fill"), tag: 3)
                
        myVC.title = "My"
        myVC.tabBarItem = UITabBarItem(title: "My", image: UIImage(systemName: "person.fill"), tag: 4)
                
        // 탭바를 View Controller에 연결
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
        tabBar.barTintColor = .black
    }
}
