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
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self).offset(120)
            $0.centerX.equalTo(self)
            $0.height.equalTo(75)
            $0.width.equalTo(287)
        }

        emailLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(87)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).inset(20)
        }

        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).inset(20)
            $0.height.equalTo(40)
        }

        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).inset(20)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).inset(20)
            $0.height.equalTo(40)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).inset(20)
            $0.height.equalTo(50)
        }

        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(87)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).inset(20)
            $0.height.equalTo(50)
        }

        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(20)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).inset(20)
            $0.height.equalTo(50)
        }
    }
}
