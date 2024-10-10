//
//  MyView.swift
//  Kream
//
//  Created by 한금준 on 10/7/24.
//

import UIKit

class MyView: UIView {

    // UI Elements
    let settingsButton = UIButton()
    
    // UIImageView를 추가하여 이미지를 표시
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50 // 이미지 둥글게 처리
        return imageView
    }()
    let usernameLabel = UILabel()
    let followerLabel = UILabel()
    let followingLabel = UILabel()
    let manageProfileButton = UIButton()
    let shareProfileButton = UIButton()
    let cameraButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // 메인페이지 상단 구성 요소
    private func setupUI() {
    // 설정 버튼
    settingsButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        settingsButton.tintColor = .black
        addSubview(settingsButton)
        
        // 카메라 버튼
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        cameraButton.tintColor = .black
        addSubview(cameraButton)
        
        // 프로필 사진
        addSubview(profileImageView)
        
        // 유저 이름
        usernameLabel.text = "Jeong_iOS"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(usernameLabel)
            
        // 팔로워 수
        followerLabel.text = "팔로워 326"
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(followerLabel)
        
        // 팔로잉 수
        followingLabel.text = "팔로잉 20"
        followingLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(followingLabel)
            
        // 프로필 관리
        manageProfileButton.setTitle("프로필 관리", for: .normal)
        manageProfileButton.setTitleColor(.black, for: .normal)
        manageProfileButton.layer.borderWidth = 1
        manageProfileButton.layer.cornerRadius = 5
        manageProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        manageProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        manageProfileButton.isEnabled = true
        addSubview(manageProfileButton)
            
        // 프로필 공유
        shareProfileButton.setTitle("프로필 공유", for: .normal)
        shareProfileButton.setTitleColor(.black, for: .normal)
        shareProfileButton.layer.borderWidth = 1
        shareProfileButton.layer.cornerRadius = 5
        shareProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        shareProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        shareProfileButton.isEnabled = true
        addSubview(shareProfileButton)
    }
    
        
    // 레이아웃 제약조건 설정
    private func setupConstraints() {
        settingsButton.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(26)
            $0.width.height.equalTo(25)
        }
        
        cameraButton.snp.makeConstraints {
            $0.centerY.equalTo(settingsButton)
            $0.trailing.equalToSuperview().offset(-26)
            $0.width.height.equalTo(25)
        }

        profileImageView.snp.makeConstraints {
            $0.top.equalTo(settingsButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
            $0.width.height.equalTo(80)
        }

        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }

        followerLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }

        followingLabel.snp.makeConstraints {
            $0.top.equalTo(followerLabel)
            $0.leading.equalTo(followerLabel.snp.trailing).offset(10)
        }

        manageProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }

        shareProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-26)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
    }
    
    // 프로필 이미지를 외부에서 설정할 수 있도록 메서드 추가
    public func setProfileImage(_ image: UIImage?) {
        profileImageView.image = image
    }
}
