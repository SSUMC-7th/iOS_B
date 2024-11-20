//
//  ProductDetailNavigationManager.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

protocol NavigationConfigurable {
    func configureNavigation()
    func handleBackAction()
}

class ProductDetailNavigationManager: NavigationConfigurable {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func configureNavigation() {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"),
            style: .plain,
            target: self,
            action: #selector(handleBackAction)
        )
        viewController?.navigationItem.leftBarButtonItem = backButton
        viewController?.navigationController?.navigationBar.tintColor = .black
        viewController?.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    @objc func handleBackAction() {
        let homeVC = HomeViewController()
        viewController?.navigationController?.setViewControllers([homeVC], animated: true)
    }
}
