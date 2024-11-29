//
//  BaseViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/3/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let HomeVC = UINavigationController(rootViewController: HomeViewController())
    private let StyleVC = StyleViewController()
    private let ShopVC = ShopViewController()
    private let SavedVC = SavedViewController()
    private let MyVC = UINavigationController(rootViewController: MyViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.tintColor = .black
        
        HomeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home"), tag: 1)
        StyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style"), tag: 2)
        ShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shop"), tag: 3)
        SavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "saved"), tag: 4)
        MyVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "my"), tag: 5)
        
        self.viewControllers = [HomeVC, StyleVC, ShopVC, SavedVC, MyVC]
        
    }


}

#Preview {
    BaseViewController()
}

