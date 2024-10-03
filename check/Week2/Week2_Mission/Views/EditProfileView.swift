//
//  EditProfileView.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import UIKit

class EditProfileView: UIView {
    
    // MARK: - UIComponents
    lazy var profileImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.crop.circle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        return image
    }()
    
    private lazy var profileLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField : UITextField = {
        
        let textField = UITextField()
        
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.black
        
        // 힌트 문자 속성
        textField.attributedPlaceholder = NSAttributedString(string: "새로운 이메일을 입력해주세요!", attributes: [.font : UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.lightGray])
        
        // 왼쪽 여백
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        // 모서리 둥글게
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    lazy var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.black
        
        // 힌트 문자 속성
        textField.attributedPlaceholder = NSAttributedString(string: "새로운 비밀번호를 입력해주세요!", attributes: [.font : UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.lightGray])
        
        // 왼쪽 여백
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        // 모서리 둥글게
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    lazy var emailButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    lazy var passwordButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
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
    
    private func addComponents(){
        addSubview(profileImage)
        addSubview(profileLabel)
        addSubview(emailLabel)
        addSubview(emailButton)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordButton)
        addSubview(passwordTextField)
        
        profileImage.snp.makeConstraints{(make) in
            make.top.equalToSuperview().inset(144)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(90)
        }
        
        profileLabel.snp.makeConstraints{(make) in
            make.top.equalTo(profileImage.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(27)
        }
        
        emailLabel.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(27)
            make.top.equalTo(profileLabel.snp.bottom).offset(23)
        }
        
        emailTextField.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(27)
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.width.equalTo(280)
            make.height.equalTo(32)
        }
        
        emailButton.snp.makeConstraints{(make) in
            make.right.equalToSuperview().inset(17)
            make.left.equalTo(emailTextField.snp.right).offset(9)
            make.top.equalTo(emailTextField)
            make.height.equalTo(32)
        }
        
        passwordLabel.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(27)
            make.top.equalTo(emailTextField.snp.bottom).offset(23)
        }
        
        passwordTextField.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(27)
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.width.equalTo(280)
            make.height.equalTo(32)
        }
        
        passwordButton.snp.makeConstraints{(make) in
            make.right.equalToSuperview().inset(17)
            make.left.equalTo(passwordTextField.snp.right).offset(9)
            make.top.equalTo(passwordTextField)
            make.height.equalTo(32)
        }
    }
    
}
