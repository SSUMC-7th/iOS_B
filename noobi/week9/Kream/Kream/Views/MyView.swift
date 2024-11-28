//
//  MyView.swift
//  Kream
//
//  Created by 한금준 on 10/7/24.
//

import UIKit

class MyView: UIView {
    
    let topBarConstraints = TopBarConstraints()
    let profileSectionConstraints = ProfileSectionConstraints()
    let actionButtonsConstraints = ActionButtonsConstraints()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        setupAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 메인페이지 상단 구성 요소
    // 설정 버튼
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 카메라 버튼
    let cameraButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // UIImageView를 추가하여 이미지를 표시
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 유저 이름
    let usernameLabel: UILabel = {
        let label = UILabel()
//        label.text = "Jeong_iOS"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    // 팔로워 수
    let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    // 팔로잉 수
    let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    // 프로필 관리 버튼
    let manageProfileButton: UIButton = {
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
    let shareProfileButton: UIButton = {
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
    
    
    
    
    // MARK: - Setup Constraints
    private func setupAllConstraints() {
        // Apply constraints using separate classes
        topBarConstraints.setupConstraints(for: self)
        profileSectionConstraints.setupConstraints(for: self)
        actionButtonsConstraints.setupConstraints(for: self)
    }
    
    // 프로필 이미지를 외부에서 설정할 수 있도록 메서드 추가
    func setProfileImage(_ image: UIImage?) {
        profileImageView.image = image
    }
}


// MARK: - TopBarConstraints: Inherits from BaseConstraints
class TopBarConstraints {
    func setupConstraints(for view: MyView) {
        view.settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(26)
            make.width.height.equalTo(25)
        }
        
        view.cameraButton.snp.makeConstraints { make in
            make.centerY.equalTo(view.settingsButton)
            make.trailing.equalToSuperview().offset(-26)
            make.width.height.equalTo(25)
        }
    }
}

// MARK: - ProfileSectionConstraints: Inherits from BaseConstraints
class ProfileSectionConstraints {
    func setupConstraints(for view: MyView) {
        view.profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.settingsButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(26)
            make.width.height.equalTo(80)
        }
        
        view.usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.profileImageView.snp.top).offset(10)
            make.leading.equalTo(view.profileImageView.snp.trailing).offset(20)
        }
        
        view.followerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.usernameLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.profileImageView.snp.trailing).offset(20)
        }
        
        view.followingLabel.snp.makeConstraints { make in
            make.top.equalTo(view.followerLabel)
            make.leading.equalTo(view.followerLabel.snp.trailing).offset(10)
        }
    }
}

// MARK: - ActionButtonsConstraints: Inherits from BaseConstraints
class ActionButtonsConstraints {
    func setupConstraints(for view: MyView) {
        view.manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view.profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(26)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        view.shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view.profileImageView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-26)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
}
