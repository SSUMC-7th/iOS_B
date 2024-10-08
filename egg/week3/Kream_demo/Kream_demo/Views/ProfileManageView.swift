//
//  profileManageView.swift
//  Kream_demo
//
//  Created by 황상환 on 10/4/24.
//

import UIKit
import SnapKit

class ProfileManageView: UIView {
    
    let profileImageView = UIImageView()
    private let progileInfo = UILabel()
    private let userEmailLabel = UILabel()
    let userEmail = UITextField() // private 해제
    let userEmailButton = UIButton()
    private let userPasswordLabel = UILabel()
    let userPassword = UITextField() // private 해제
    let userPasswordButton = UIButton()
    
    // 버튼 액션 클로저
    var onUserEmailButtonTapped: (() -> Void)?
    var onUserPasswordButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        // Subview 추가
        self.addSubview(profileImageView)
        self.addSubview(progileInfo)
        self.addSubview(userEmailLabel)
        self.addSubview(userPasswordLabel)
        self.addSubview(userEmail)
        self.addSubview(userPassword)
        self.addSubview(userEmailButton)
        self.addSubview(userPasswordButton)
        
        // SnapKit으로 레이아웃 설정
        setupLayout()
        setupComponents()
        setupActions() // 추가된 액션 설정 메서드
        
        // 버튼 액션 추가
        userEmailButton.addTarget(self, action: #selector(userEmailButtonTapped), for: .touchUpInside)
        userPasswordButton.addTarget(self, action: #selector(userPasswordButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLayout() {
        
        // 프로필 이미지 레이아웃
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(52)
            $0.width.height.equalTo(90)
        }
        
        // 프로필 정보 라벨 레이아웃
        progileInfo.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        
        // 유저 이메일 라벨
        userEmailLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(27)
            $0.top.equalTo(progileInfo.snp.bottom).offset(23)
        }
        
        // 유저 이메일 텍스트필드
        userEmail.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(27)
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        // 이메일 확인 버튼
        userEmailButton.snp.makeConstraints {
            $0.leading.equalTo(userEmail.snp.trailing).offset(10)
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(6)
            $0.trailing.equalToSuperview().offset(-27)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        // 유저 비밀번호 라벨 레이아웃
        userPasswordLabel.snp.makeConstraints {
            $0.leading.equalTo(userEmail.snp.leading)
            $0.top.equalTo(userEmail.snp.bottom).offset(20)
        }
        
        // 유저 비밀번호 텍스트필드 레이아웃
        userPassword.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(27)
            $0.top.equalTo(userPasswordLabel.snp.bottom).offset(6)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        // 비밀번호 확인 버튼
        userPasswordButton.snp.makeConstraints {
            $0.leading.equalTo(userPassword.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-27)
            $0.top.equalTo(userPassword.snp.top)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
    }
    
    private func setupComponents() {
        // 프로필 이미지 설정
        profileImageView.image = UIImage(named: "profile_img")
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        
        // 프로필 정보 라벨 설정
        progileInfo.text = "프로필 정보"
        progileInfo.font = UIFont.boldSystemFont(ofSize: 18)
        
        // 유저 이메일 라벨 설정
        userEmailLabel.text = "유저 이메일"
        userEmailLabel.font = UIFont.systemFont(ofSize: 14)
        
        // 유저 비밀번호 라벨 설정
        userPasswordLabel.text = "유저 비밀번호"
        userPasswordLabel.font = UIFont.systemFont(ofSize: 14)
        
        // 텍스트필드 설정
        userEmail.placeholder = "새로운 이메일을 입력해주세요!"
        userEmail.borderStyle = .none
        userEmail.layer.cornerRadius = 10
        userEmail.layer.borderColor = UIColor.lightGray.cgColor
        userEmail.layer.borderWidth = 1
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        userEmail.leftView = emailPaddingView
        userEmail.leftViewMode = .always
        userEmail.font = UIFont.boldSystemFont(ofSize: 14)
        
        userPassword.placeholder = "새로운 비밀번호를 입력해주세요!"
        userPassword.borderStyle = .none
        userPassword.layer.cornerRadius = 10
        userPassword.layer.borderColor = UIColor.lightGray.cgColor
        userPassword.layer.borderWidth = 1
        userPassword.isSecureTextEntry = true
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        userPassword.leftView = passwordPaddingView
        userPassword.leftViewMode = .always
        userPassword.font = UIFont.boldSystemFont(ofSize: 14)
        
        userEmail.isUserInteractionEnabled = false // 처음에는 수정 불가능
        userPassword.isUserInteractionEnabled = false // 처음에는 수정 불가능
        
        // 이메일 확인 버튼 설정
        userEmailButton.setTitle("변경", for: .normal)
        userEmailButton.setTitleColor(.black, for: .normal)
        userEmailButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        userEmailButton.layer.borderWidth = 1
        userEmailButton.layer.borderColor = UIColor.black.cgColor
        userEmailButton.layer.cornerRadius = 6
        
        // 비밀번호 버튼 설정
        userPasswordButton.setTitle("변경", for: .normal)
        userPasswordButton.setTitleColor(.black, for: .normal)
        userPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        userPasswordButton.layer.borderWidth = 1
        userPasswordButton.layer.borderColor = UIColor.black.cgColor
        userPasswordButton.layer.cornerRadius = 6
    }
    
    private func setupActions() {
        // 이메일 버튼과 비밀번호 버튼에 액션 추가
        userEmailButton.addTarget(self, action: #selector(userEmailButtonTapped), for: .touchUpInside)
        userPasswordButton.addTarget(self, action: #selector(userPasswordButtonTapped), for: .touchUpInside)
        
    }
    
    func setProfileImage(_ image: UIImage?) {
        profileImageView.image = image
    }
    
    @objc private func userEmailButtonTapped() {
        if userEmailButton.currentTitle == "변경" {
            userEmail.isUserInteractionEnabled = true
            userEmailButton.setTitle("확인", for: .normal)
        } else {
            userEmail.isUserInteractionEnabled = false
            userEmailButton.setTitle("변경", for: .normal)
            
            // 수정된 이메일을 UserDefaults에 저장
            UserDefaults.standard.set(userEmail.text, forKey: "savedEmail")
        }
    }
    
    // 비밀번호 버튼 동작
    @objc private func userPasswordButtonTapped() {
        if userPasswordButton.currentTitle == "변경" {
            userPassword.isUserInteractionEnabled = true
            userPasswordButton.setTitle("확인", for: .normal)
        } else {
            userPassword.isUserInteractionEnabled = false
            userPasswordButton.setTitle("변경", for: .normal)
            
            // 수정된 비밀번호를 UserDefaults에 저장
            UserDefaults.standard.set(userPassword.text, forKey: "savedPassword")
        }
    }
}


#Preview {
    ProfileManageView()
}
