//
//  ViewController.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import UIKit

import SnapKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    
    // 뷰 연결
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginView()
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
        
    private func setupLoginView() {
        // 현재 뷰의 서브 뷰
        view.addSubview(loginView)
        // Auto Layout 사용
        loginView.translatesAutoresizingMaskIntoConstraints = false
        // 제약조건 활성화 - 부모 view의 크기에 맞게 고정
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    @objc
    func loginButtonTapped() {
        // 로그인 성공 시 메인 TabBarController로 전환
        // Modal 방식
        let mainpageViewController = MainPageViewController()
        
        mainpageViewController.view.backgroundColor = .white
        mainpageViewController.modalPresentationStyle = .fullScreen
        
        present(mainpageViewController, animated: true, completion: nil)
        
    }
}

