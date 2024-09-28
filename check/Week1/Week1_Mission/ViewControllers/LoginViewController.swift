//
//  ViewController.swift
//  Week1_Mission
//
//  Created by LEE on 2024/09/28.
//

import UIKit

class LoginViewController: UIViewController {

    let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = LoginView()
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        loginView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
        

        self.view = loginView
    }
    
    // MARK: - 버튼 터치 이벤트 핸들러
    @objc func loginButtonTapped(){
        print("[로그인] 누름")
    }
    
    @objc func kakaoLoginButtonTapped(){
        print("[카카오로 로그인] 누름")
    }
    
    @objc func appleLoginButtonTapped(){
        print("[Apple로 로그인] 누름")
    }
                                      
    
    // MARK: - 텍스트 필드 이벤트 핸들러
    @objc func updateEnteredEmail(){
        
            
    }
    
    @objc func updateEnteredPassword(){
        
    }

}

