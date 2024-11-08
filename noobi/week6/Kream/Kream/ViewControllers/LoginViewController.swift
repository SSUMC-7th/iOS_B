//
//  ViewController.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import UIKit

import SnapKit

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()
    private let profilemanageView = ProfileManageView()
    
    // 뷰 연결
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginView()
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    private func setupLoginView() {
        // 현재 뷰의 서브 뷰
        view.addSubview(loginView)
        // Auto Layout 사용
        loginView.translatesAutoresizingMaskIntoConstraints = false
        // 제약조건 활성화 - 부모 view의 크기에 맞게 고정
        loginView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    @objc
    func loginButtonTapped() {
        guard let id = loginView.emailTextField.text, !id.isEmpty else { return }
        guard let password = loginView.passwordTextField.text, !password.isEmpty else { return }
        
        // 모델을 통해 텍스트 저장
        loginModel.saveUserId(id)
        loginModel.saveUserPwd(password)
        
        // ProfileManageViewController로 이메일과 비밀번호를 전달
        let profileManageView = ProfileManageView()
        profileManageView.emailTextField.text = id
        profileManageView.passwordTextField.text = password
        
        // 로그인 성공 시 메인 TabBarController로 전환
        // Modal 방식
        let mainpageViewController = MainPageViewController()
        
        mainpageViewController.view.backgroundColor = .white
        mainpageViewController.modalPresentationStyle = .fullScreen
        
        present(mainpageViewController, animated: true, completion: nil)
        
    }
}

