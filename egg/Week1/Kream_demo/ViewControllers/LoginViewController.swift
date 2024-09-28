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
        // Do any additional setup after loading the view.
        
        let loginView = LoginView(frame: self.view.bounds)
        self.view.addSubview(loginView)

    }


}

