//
//  ViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 9/26/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = LoginView(frame: self.view.bounds)
        self.view.addSubview(loginView)
     
        loginView.onLoginButtonTapped = { [weak self] in
            
            let baseVC = BaseViewController()
            
            baseVC.modalPresentationStyle = .fullScreen
            self?.present(baseVC, animated: true, completion: nil)
        }
    }
    
}

#Preview {
    LoginViewController()
}
