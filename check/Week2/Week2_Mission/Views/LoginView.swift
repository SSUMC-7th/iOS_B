//
//  LoginView.swift
//  Week1_Mission
//
//  Created by LEE on 2024/09/28.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - UIComponents
    private lazy var kreamLogoImageView : UIImageView = {
       
        let image = UIImage(named: "Kream_Logo.png")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var emailLabel : UILabel = {
        
        let label = UILabel()
        
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    public lazy var emailTextField : UITextField = {
        
        let textField = UITextField()
        
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.black
        
        // 힌트 문자 속성
        textField.attributedPlaceholder = NSAttributedString(string: "예) kream@kream.co.kr", attributes: [.font : UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.lightGray])
        
        // 왼쪽 여백
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        // 모서리 둥글게
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    
    private lazy var passwordLabel : UILabel = {
        
        let label = UILabel()
        
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    public lazy var passwordTextField : UITextField = {
        
        let textField = UITextField()
        
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.black
        
        // 힌트 문자 속성
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [.font : UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.lightGray])
        
        // 왼쪽 여백
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        // 모서리 둥글게
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public lazy var loginButton : UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        
        button.setTitleColor(.white, for: .normal)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)

        button.layer.cornerRadius = 5
    
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    public lazy var kakaoLoginButton : UIButton = {
        
        let button = UIButton()
        
        button.setTitle("카카오로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.titleLabel?.textAlignment = .center
        
        button.setImage(UIImage(named: "Kakao_Logo.png"), for: .normal)
        
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.4
        
        // 오토레이아웃으로 버튼 이미지 위치 설정
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    public lazy var appleLoginButton : UIButton = {
        
        let button = UIButton()
    
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.titleLabel?.textAlignment = .center

        button.setImage(UIImage(named: "Apple_Logo.png"), for: .normal)
        
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.4
        
        // 오토레이아웃으로 버튼 내 이미지 위치 설정
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    // MARK: - 이니셜라이저
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    
    required init?(coder: NSCoder){
        fatalError("NSCoder Error")
    }
    
    
    // MARK: - 오토 레이아웃
    private func addComponents(){
        self.addSubview(kreamLogoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            
            kreamLogoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            kreamLogoImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53),
            kreamLogoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            kreamLogoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -651),
            
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            emailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 288),
            
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 8),
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            passwordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            passwordLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            passwordLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 17),
            
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),

            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            loginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 17),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            kakaoLoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            kakaoLoginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.5),
            kakaoLoginButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 561),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            kakaoLoginButton.imageView!.heightAnchor.constraint(equalToConstant: 15),
            kakaoLoginButton.imageView!.widthAnchor.constraint(equalToConstant: 15),
            kakaoLoginButton.imageView!.leftAnchor.constraint(equalTo: kakaoLoginButton.leftAnchor, constant: 17),
            kakaoLoginButton.imageView!.centerYAnchor.constraint(equalTo: kakaoLoginButton.centerYAnchor),
            
            kakaoLoginButton.titleLabel!.centerXAnchor.constraint(equalTo: kakaoLoginButton.centerXAnchor),
            kakaoLoginButton.titleLabel!.centerYAnchor.constraint(equalTo: kakaoLoginButton.centerYAnchor),

            appleLoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            appleLoginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.5),
            appleLoginButton.topAnchor.constraint(equalTo: self.kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),

            appleLoginButton.titleLabel!.centerXAnchor.constraint(equalTo: appleLoginButton.centerXAnchor),
            appleLoginButton.titleLabel!.centerYAnchor.constraint(equalTo: appleLoginButton.centerYAnchor),

            appleLoginButton.imageView!.heightAnchor.constraint(equalToConstant: 15),
            appleLoginButton.imageView!.widthAnchor.constraint(equalToConstant: 15),
            appleLoginButton.imageView!.leftAnchor.constraint(equalTo: appleLoginButton.leftAnchor, constant: 17),
            appleLoginButton.imageView!.centerYAnchor.constraint(equalTo: appleLoginButton.centerYAnchor),
            
        ])
    }

}
