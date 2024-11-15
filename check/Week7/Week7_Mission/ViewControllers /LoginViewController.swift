//
//  ViewController.swift
//  Week1_Mission
//
//  Created by LEE on 2024/09/28.
//

import UIKit

class LoginViewController: UIViewController {

    var loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = LoginView()
    
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        loginView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
        
        loginView.emailTextField.addTarget(self, action: #selector(updateEnteredEmail(_:)), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(updateEnteredPassword(_:)), for: .editingChanged)
        self.view = loginView
    }
    
    // MARK: - 버튼 터치 이벤트 핸들러
    @objc func loginButtonTapped(){
        print("[로그인] 누름")
        loginModel.login()
        let mainTabBarVC = MainTabBarController()
        mainTabBarVC.modalPresentationStyle = .fullScreen
        
        present(mainTabBarVC, animated: true)
    
    }
    
    @objc func kakaoLoginButtonTapped(){
        print("[카카오로 로그인] 누름")
        
//        if KakaoLoginManager.shared.tryLogin() {
//            print("ds")
//            if let nickname = KakaoLoginManager.shared.getUserNickname(){
//                var profileModel = ProfileModel()
//                profileModel.setNickname(by: nickname)
//            }
//            
//            print("dd")
//            let mainTabBarVC = MainTabBarController()
//            mainTabBarVC.modalPresentationStyle = .fullScreen
//            
//            present(mainTabBarVC, animated: true)
//        }
        
        KakaoLoginManager.shared.tryLogin { isSuccess in
            if isSuccess {

                KakaoLoginManager.shared.getUserNickname{ nickname in
                    if let nickname = nickname {
                        var profileModel = ProfileModel()
                        profileModel.setNickname(by: nickname)
                    }
                }
            
                let mainTabBarVC = MainTabBarController()
                mainTabBarVC.modalPresentationStyle = .fullScreen
                
                self.present(mainTabBarVC, animated: true)
            }
        }
        
    }
    
    @objc func appleLoginButtonTapped(){
        print("[Apple로 로그인] 누름")
    }
                                      
    
    // MARK: - 텍스트 필드 이벤트 핸들러
    @objc func updateEnteredEmail(_ textField: UITextField){
        if let email = textField.text {
            loginModel.setEmail(by: email)
            print("dd")
        }
            
    }
    
    @objc func updateEnteredPassword(_ textField: UITextField){
        if let password = textField.text{
            loginModel.setPassword(by: password)
            print("ff")
        }
    }

}
