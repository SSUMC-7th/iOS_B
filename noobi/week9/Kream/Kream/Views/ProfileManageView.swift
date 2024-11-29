//
//  ProfileManage.swift
//  Kream
//
//  Created by 한금준 on 10/7/24.
//

import UIKit

import SnapKit

class ProfileManageView: UIView {
    
    private let loginModel = LoginModel()
    private let myView = MyView()

    // UI Elements
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50 // 원하는 스타일 적용 가능
        return imageView
    }()
    
    let profileNameTextField = UITextField()
    let infoLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let emailChangeButton = UIButton()
    let passwordChangeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        loadId()
        loadPwd()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupUI() {
        // 프로필 이미지 설정
        addSubview(profileImageView)
            
        // 프로필 이름 TextField 설정
        profileNameTextField.text = "Jeong_iOS"
        profileNameTextField.font = UIFont.systemFont(ofSize: 18)
        profileNameTextField.borderStyle = .roundedRect
        profileNameTextField.textAlignment = .center
        addSubview(profileNameTextField)
        
        infoLabel.text = "프로필 정보"
        infoLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(infoLabel)
            
        // 이메일 라벨 설정
        emailLabel.text = "유저 이메일"
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(emailLabel)
        
        emailTextField.text = "example@naver.com"
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        // 수정 불가능하게 초기 설정
        emailTextField.isUserInteractionEnabled = false
        addSubview(emailTextField)
        
        // 비밀번호 라벨 설정
        passwordLabel.text = "유저 비밀번호"
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(passwordLabel)
            
        // 비밀번호 TextField 설정
        passwordTextField.text = "****************"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        // 수정 불가능하게 초기 설정
        passwordTextField.isUserInteractionEnabled = false
        addSubview(passwordTextField)
            
        // 이메일 변경 버튼 설정
        emailChangeButton.setTitle("변경", for: .normal)
        emailChangeButton.setTitleColor(.black, for: .normal)
        emailChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        emailChangeButton.layer.borderWidth = 1
        emailChangeButton.layer.cornerRadius = 5
        addSubview(emailChangeButton)
            
        // 비밀번호 변경 버튼 설정
        passwordChangeButton.setTitle("변경", for: .normal)
        passwordChangeButton.setTitleColor(.black, for: .normal)
        passwordChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        passwordChangeButton.layer.borderWidth = 1
        passwordChangeButton.layer.cornerRadius = 5
        addSubview(passwordChangeButton)
    }
        
    func setupConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(90)
        }
            
        profileNameTextField.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
            
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(profileNameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(349)
            $0.height.equalTo(29)
        }
            
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
            
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalTo(emailChangeButton.snp.leading).offset(-10)
            $0.height.equalTo(40)
        }
            
        emailChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(emailTextField)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
        }
            
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
            
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalTo(passwordChangeButton.snp.leading).offset(-10)
            $0.height.equalTo(40)
        }
            
        passwordChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
        }
    }
    
    // 지정된 Id 값이 있을 경우 가져오기
    private func loadId(){
        if let savedId = loginModel.loadUserId(){
            emailTextField.text = savedId
        }
    }
    // 지정된 pwd 값이 있을 경우 가져오기
    private func loadPwd(){
        if let savedPwd = loginModel.loadUserPwd(){
            passwordTextField.text = savedPwd
        }
    }
}
