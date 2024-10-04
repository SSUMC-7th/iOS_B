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
    private let profileImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let followerLabel = UILabel()
    private let profileManageButton = UIButton()
    private let profileShareButton = UIButton()
    private let line = UIView()
    
    var onProfileManageButtonTapped: (() -> Void)?


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        line.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        
        // Subview
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
        
        profileManageButton.addTarget(self, action: #selector(profileManageButtonTapped), for: .touchUpInside)

    }
    
    // 버튼이 눌렸을 때 호출되는 메서드
    @objc private func profileManageButtonTapped() {
        onProfileManageButtonTapped?()  // 클로저 호출
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 레이아웃
    private func setupLayout() {
        
        // 설정 아이콘
        settingsIcon.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(25)
        }
        
        // 카메라 아이콘
        cameraIcon.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            $0.trailing.equalToSuperview().offset(-32.5)
            $0.width.height.equalTo(25)
        }
        
        // 프로필 이미지
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(32.5)
            $0.top.equalTo(settingsIcon.snp.bottom).offset(26)
            $0.width.height.equalTo(90)
        }
        
        // 유저 이름
        usernameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.centerY.equalTo(profileImageView.snp.centerY).offset(-10)          }

        // 팔로워 팔로잉
        followerLabel.snp.makeConstraints {
            $0.leading.equalTo(usernameLabel.snp.leading)
            $0.top.equalTo(usernameLabel.snp.bottom).offset(6)
        }
        
        // 프로필 관리
        profileManageButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }

        // 프로필 공유
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
    
    // 컴포넌트 속성
    private func setupComponents() {
        
        // 설정
        settingsIcon.image = UIImage(named: "setting")
        settingsIcon.contentMode = .scaleAspectFit
        
        // 카메라
        cameraIcon.image = UIImage(named: "camera")
        cameraIcon.contentMode = .scaleAspectFit
        
        // 프로필
        profileImageView.image = UIImage(named: "profile_img") // 여기에 프로필 이미지 넣기
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        
        // 유저 이름
        usernameLabel.text = "Jeong_iOS"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        usernameLabel.textColor = .black
        
        // 팔로워 팔로잉
        followerLabel.text = "팔로워 326   팔로잉 20"
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        followerLabel.textColor = .black
        
        // 프로필 관리
        profileManageButton.setTitle("프로필 관리", for: .normal)
        profileManageButton.setTitleColor(.black, for: .normal)
        profileManageButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        profileManageButton.layer.borderWidth = 1
        profileManageButton.layer.borderColor = UIColor.lightGray.cgColor
        profileManageButton.layer.cornerRadius = 10
        
        // 프로필 공유
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
