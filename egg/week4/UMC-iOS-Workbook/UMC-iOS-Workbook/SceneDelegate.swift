//
//  SceneDelegate.swift
//  UMC-iOS-Workbook
//
//  Created by 황상환 on 9/24/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TeenipingViewController()
        window?.makeKeyAndVisible()
    }


}

