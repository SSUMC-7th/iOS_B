//
//  ViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 9/26/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.frame = self.view.bounds
        self.view.addSubview(loginView)
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        // 카카오톡 로그인 버튼 액션 추가
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        
        if let savedEmail = UserDefaults.standard.string(forKey: "savedEmail"),
           let savedPassword = UserDefaults.standard.string(forKey: "savedPassword") {
            loginView.emailTextField.text = savedEmail
            loginView.passwordTextField.text = savedPassword
        }
    }
    
    @objc func loginButtonClicked() {
        guard let email = loginView.emailTextField.text, !email.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            print("이메일 또는 비밀번호를 입력해주세요")
            return
        }
            
        // 이메일 비밀번호 저장
        UserDefaults.standard.set(email, forKey: "savedEmail")
        UserDefaults.standard.set(password, forKey: "savedPassword")
        
        print("이메일과 비밀번호가 저장되었습니다.")
        
        let baseVC = BaseViewController()
        baseVC.modalPresentationStyle = .fullScreen
        self.present(baseVC, animated: true, completion: nil)
    }
    
    // 카카톡 버튼!
    @objc private func kakaoLoginButtonTapped() {
        print("카카오 로그인 버튼 탭")
        KakaoAuthService.shared.handleKakaoLogin { [weak self] result in
            switch result {
            case .success(let nickname):
                print("로그인 성공, 닉네임: \(nickname)")
                DispatchQueue.main.async {
                    let baseVC = BaseViewController()
                    baseVC.modalPresentationStyle = .fullScreen
                    self?.present(baseVC, animated: true) {
                        print("베이스뷰로 화면 전환 완료")
                    }
                }
            case .failure(let error):
                print("로그인 실패: \(error.localizedDescription)")
            }
        }
    }
}


//#Preview {
//    LoginViewController()
//}
