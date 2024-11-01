//
//  LoginView.swift
//  Kream_demo
//
//  Created by 황상환 on 9/26/24.
//

import UIKit

class LoginView: UIView {
    
    // 버튼 액션을 전달하기 위한 클로저..
    var onLoginButtonTapped: (() -> Void)?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func loginButtonAction() {
            // 버튼 클릭 시 클로저 실행
            onLoginButtonTapped?()
        }
    
    
    private func addComponents() {
        self.addSubview(logoImage)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        self.setupLayout() 
    }
    
    // 컴포넌트
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.image = UIImage(named: "kream_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // private 해제
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = "예) kream@kream.co.kr"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0).cgColor
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // private 해제
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.placeholder = "비밀번호를 입력해주세요"
        passwordTextField.font = UIFont.systemFont(ofSize: 12)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0).cgColor
        passwordTextField.layer.masksToBounds = true
        return passwordTextField
    }()
    
    let loginButton: UIButton = { // private 해제
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private let kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.setImage(UIImage(named: "kakao_logo"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 211/255.0, green: 211/255.0, blue: 211/255.0, alpha: 1.0).cgColor
        button.imageView?.contentMode = .scaleAspectFit
        
        // 여백 설정
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 86, bottom: 0, right: 0)
       
        return button
    }()

    private let appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.setImage(UIImage(named: "apple_logo"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 211/255.0, green: 211/255.0, blue: 211/255.0, alpha: 1.0).cgColor
        button.imageView?.contentMode = .scaleAspectFit
        
        // 여백 설정
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 86, bottom: 0, right: 0)
        
        return button
    }()


    
    // 레이아웃
    private func setupLayout() {
        // Auto Layout 활성화
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // logoImage 제약
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 126),
            logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 287),
            logoImage.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        // emailLabel 제약
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -8),
            emailLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
        ])
        
        // emailTextField 제약
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 110),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 303),
            emailTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        // passwordLabel 제약
        NSLayoutConstraint.activate([
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -8),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
        
        // passwordTextField 제약
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 303),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        // loginButton 제약
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.widthAnchor.constraint(equalToConstant: 303),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        // kakao버튼
        NSLayoutConstraint.activate([
            kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.widthAnchor.constraint(equalToConstant: 298),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            kakaoLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        // apple버튼
        NSLayoutConstraint.activate([
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.widthAnchor.constraint(equalToConstant: 298),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),
            appleLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        
    }

}

//#Preview {
//    LoginView()
//}
