//
//  LoginView.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import UIKit

class LoginView: UIView {
    
       let logoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "Kream_logo") // 로고 이미지 설정
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    
       let emailLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "이메일 주소"
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .black
            return label
        }()
        
        let emailTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "예) kream@kream.co.kr"
            textField.borderStyle = .roundedRect
            textField.clearButtonMode = .whileEditing
            return textField
        }()
    
       let passwordLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "비밀번호"
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .black
            return label
        }()
        
        let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "비밀번호를 입력해주세요"
            textField.borderStyle = .roundedRect
            textField.isSecureTextEntry = true
            textField.clearButtonMode = .whileEditing
            return textField
        }()
        
        let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("로그인", for: .normal)
            button.backgroundColor = .lightGray
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 5
            button.isEnabled = false // 기본은 비활성화 상태
            return button
        }()
        
        let kakaoLoginButton: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("카카오로 로그인", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 5
            return button
        }()
        
        let appleLoginButton: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Apple로 로그인", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 5
            return button
        }()
        
        // Initializer
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            addSubview(logoImageView)
            addSubview(emailLabel)  // 이메일 레이블 추가
            addSubview(emailTextField)
            addSubview(passwordLabel)
            addSubview(passwordTextField)
            addSubview(loginButton)
            addSubview(kakaoLoginButton)
            addSubview(appleLoginButton)
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                
                logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
                logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                logoImageView.heightAnchor.constraint(equalToConstant: 75),
                logoImageView.widthAnchor.constraint(equalToConstant: 287),
                
                emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 87),
                emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                
                emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
                emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                emailTextField.heightAnchor.constraint(equalToConstant: 40),
                
                passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
                passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                passwordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                
                passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
                passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                passwordTextField.heightAnchor.constraint(equalToConstant: 40),
                
            
                loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
                loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                loginButton.heightAnchor.constraint(equalToConstant: 50),
                
                
                kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
                kakaoLoginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                kakaoLoginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                kakaoLoginButton.heightAnchor.constraint(equalToConstant: 50),
                
                
                appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 20),
                appleLoginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                appleLoginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                appleLoginButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
}
