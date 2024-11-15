//
//  MyView.swift
//  Kream_demo
//
//  Created by 황상환 on 10/4/24.
//

import UIKit
import SnapKit

class MyView: UIView {
    
    private let settingsIcon = UIImageView()
    private let cameraIcon = UIImageView()
    let profileImageView = UIImageView() // private 해제
    let usernameLabel = UILabel()
    private let followerLabel = UILabel()
    let profileManageButton = UIButton()
    private let profileShareButton = UIButton()
    private let line = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        line.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        
        // Subview 추가
        self.addSubview(settingsIcon)
        self.addSubview(cameraIcon)
        self.addSubview(profileImageView)
        self.addSubview(usernameLabel)
        self.addSubview(followerLabel)
        self.addSubview(profileManageButton)
        self.addSubview(profileShareButton)
        self.addSubview(line)

        setupLayout()
        setupComponents()
        updateNickname()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 카카오톡 닉네임 불러오기
    private func updateNickname() {
        if let nickname = KeychainManager.shared.load(key: "userNickname") {
            usernameLabel.text = nickname
            print("내 닉네임 : \(nickname)")
        } else {
            usernameLabel.text = "닉네임 못찾음"
            print("닉네임 못찾음")
        }
    }

    // 레이아웃 설정
    private func setupLayout() {
        // 각 요소에 대해 SnapKit을 이용한 레이아웃 설정
        settingsIcon.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(25)
        }
        
        cameraIcon.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            $0.trailing.equalToSuperview().offset(-32.5)
            $0.width.height.equalTo(25)
        }
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(32.5)
            $0.top.equalTo(settingsIcon.snp.bottom).offset(26)
            $0.width.height.equalTo(90)
        }

        usernameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.centerY.equalTo(profileImageView.snp.centerY).offset(-10)
        }

        followerLabel.snp.makeConstraints {
            $0.leading.equalTo(usernameLabel.snp.leading)
            $0.top.equalTo(usernameLabel.snp.bottom).offset(6)
        }
        
        profileManageButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }

        profileShareButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(26)
            $0.leading.equalTo(profileManageButton.snp.trailing).offset(14)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
            $0.trailing.equalToSuperview().offset(-32.5)
        }
        
        line.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(profileManageButton.snp.bottom).offset(24)
            $0.height.equalTo(24)
        }
    }
    
    // 컴포넌트 설정
    private func setupComponents() {
        settingsIcon.image = UIImage(named: "setting")
        settingsIcon.contentMode = .scaleAspectFit
        
        cameraIcon.image = UIImage(named: "camera")
        cameraIcon.contentMode = .scaleAspectFit
        
        profileImageView.image = UIImage(named: "profile_img")
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        
        usernameLabel.text = "Jeong_iOS"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        usernameLabel.textColor = .black
        
        followerLabel.text = "팔로워 326   팔로잉 20"
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        followerLabel.textColor = .black
        
        profileManageButton.setTitle("프로필 관리", for: .normal)
        profileManageButton.setTitleColor(.black, for: .normal)
        profileManageButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        profileManageButton.layer.borderWidth = 1
        profileManageButton.layer.borderColor = UIColor.lightGray.cgColor
        profileManageButton.layer.cornerRadius = 10
        
        profileShareButton.setTitle("프로필 공유", for: .normal)
        profileShareButton.setTitleColor(.black, for: .normal)
        profileShareButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        profileShareButton.layer.borderWidth = 1
        profileShareButton.layer.borderColor = UIColor.lightGray.cgColor
        profileShareButton.layer.cornerRadius = 10
    }
}



#Preview {
    MyView()
}
