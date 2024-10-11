//
//  MainTabBarController.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let homeVC = HomePageViewController()
    private let styleVC = UIViewController()
    private let shopVC = UIViewController()
    private let savedVC = SavedItemPageViewController()
    private let myPageVC = UINavigationController(rootViewController: MyPageViewController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeVC.tabBarItem.tag = 0
        
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        
        styleVC.tabBarItem.tag = 1
        
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(systemName: "rectangle.and.text.magnifyingglass.rtl"), tag: 2)
       
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(systemName: "bookmark"),selectedImage: UIImage(systemName: "bookmark.fill"))
        savedVC.tabBarItem.tag = 3
        
        myPageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), selectedImage : UIImage(systemName: "person.fill"))
        myPageVC.tabBarItem.tag = 4
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray

        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageVC]
                                
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
