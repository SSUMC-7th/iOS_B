//
//  ViewController.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
            view.backgroundColor = .white
            setupLoginView()
        }
        
        private func setupLoginView() {
            view.addSubview(loginView)
            loginView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                loginView.topAnchor.constraint(equalTo: view.topAnchor),
                loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }


}

