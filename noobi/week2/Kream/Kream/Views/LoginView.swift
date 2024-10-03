//
//  LoginView.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import UIKit

import SnapKit

class LoginView: UIView {
    
    // 코드에서 뷰를 생성할 수 있도록.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // 스토리보드 사용할 경우 지원하지 않도록.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Kream_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
        
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "예) kream@kream.co.kr"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    public lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
        
    public lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        return textField
    }()
        
    public lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.isEnabled = true
        return button
    }()
        
    public lazy var kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false

        var config = UIButton.Configuration.plain()
        config.title = "카카오로 로그인"

        config.baseForegroundColor = .black
        config.image = UIImage(named: "Path")
        config.imagePadding = 80
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 110)
        button.configuration = config
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.contentHorizontalAlignment = .center
        return button
    }()
        
    public lazy var appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.plain()
        config.title = "Apple로 로그인"
        
        config.baseForegroundColor = .black
        config.image = UIImage(named: "Vector")
        config.imagePadding = 80
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 110)
        button.configuration = config
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.contentHorizontalAlignment = .center
        return button
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//            
//        // 버튼 텍스트 설정
//        button.setTitle("Apple로 로그인", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//
//        // 버튼 이미지 설정 (로고 이미지)
//        button.setImage(UIImage(named: "Vector"), for: .normal)
//            
//        // 이미지와 텍스트 위치를 수동으로 조정하기 위해 오토레이아웃 사용
//        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
//            
//        // 버튼 스타일 설정
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.cornerRadius = 5
//        
//        // 이미지와 텍스트 위치를 SnapKit으로 조정
//        button.imageView?.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(10)  // 왼쪽에서 10pt 간격
//            make.centerY.equalToSuperview()  // 버튼의 수직 중앙에 배치
//            make.width.height.equalTo(24)    // 로고 크기 24x24
//        }
//            
//        button.titleLabel?.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()  // 텍스트를 버튼의 수평 중앙에 배치
//            make.centerY.equalToSuperview()  // 버튼의 수직 중앙에 배치
//        }
//        // 텍스트의 왼쪽 여백 추가 (이미지와 텍스트가 겹치지 않도록)
//           button.contentHorizontalAlignment = .center  // 버튼 내용물을 중앙에 배치
//           button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
//        return button
    }()
        
    private func setupView() {
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
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
