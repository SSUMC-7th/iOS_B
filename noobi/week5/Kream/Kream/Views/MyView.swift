//
//  MyView.swift
//  Kream
//
//  Created by 한금준 on 10/7/24.
//

import UIKit

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // 메인페이지 상단 구성 요소
    // 설정 버튼
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .black
        return button
    }()

    // 카메라 버튼
    private let cameraButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        return button
    }()

    // UIImageView를 추가하여 이미지를 표시
    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()

    // 유저 이름
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    // 팔로워 수
    private let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    // 팔로잉 수
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    // 프로필 관리 버튼
    /*private*/ let manageProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.isEnabled = true
        return button
    }()

    // 프로필 공유 버튼
    private let shareProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.isEnabled = true
        return button
    }()
    
    private func setupUI() {
        addSubview(settingsButton)
        addSubview(cameraButton)
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(followerLabel)
        addSubview(followingLabel)
        addSubview(manageProfileButton)
        addSubview(shareProfileButton)
    }
    
        
    // 레이아웃 제약조건 설정
    private func setupConstraints() {
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(26)
            make.width.height.equalTo(25)
        }
        
        cameraButton.snp.makeConstraints { make in
            make.centerY.equalTo(settingsButton)
            make.trailing.equalToSuperview().offset(-26)
            make.width.height.equalTo(25)
        }

        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(26)
            make.width.height.equalTo(80)
        }

        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top).offset(10)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }

        followerLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(10)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }

        followingLabel.snp.makeConstraints { make in
            make.top.equalTo(followerLabel)
            make.leading.equalTo(followerLabel.snp.trailing).offset(10)
        }

        manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(26)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }

        shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-26)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
    
    // 프로필 이미지를 외부에서 설정할 수 있도록 메서드 추가
    /*private*/ func setProfileImage(_ image: UIImage?) {
        profileImageView.image = image
    }
}
