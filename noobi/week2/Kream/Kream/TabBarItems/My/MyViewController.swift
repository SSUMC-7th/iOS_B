//
//  MyViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit

class MyViewController: UIViewController {
    // MyViewController를 UINavigationController로 감싸기
    let profileController = UINavigationController(rootViewController: ProfileManageViewController())
    
    // UI Elements
    private let settingsButton = UIButton()
    private let profileImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let followerLabel = UILabel()
    private let followingLabel = UILabel()
    private let manageProfileButton = UIButton()
    private let shareProfileButton = UIButton()
    private let cameraButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        
        // 버튼 동작 구현
        manageProfileButton.addTarget(self, action: #selector(didTapManageProfileButton), for: .touchUpInside)
    }
    // 메인페이지 상단 구성 요소
    func setupUI() {
        // 설정 버튼
        settingsButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        settingsButton.tintColor = .black
        view.addSubview(settingsButton)
        
        // 카메라 버튼
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        cameraButton.tintColor = .black
        view.addSubview(cameraButton)
            
        // 프로필 사진
        profileImageView.image = UIImage(named: "profile")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        view.addSubview(profileImageView)
            
        // 유저 이름
        usernameLabel.text = "Jeong_iOS"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(usernameLabel)
            
        // 팔로워 수
        followerLabel.text = "팔로워 326"
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(followerLabel)
            
        // 팔로잉 수
        followingLabel.text = "팔로잉 20"
        followingLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(followingLabel)
            
        // 프로필 관리
        manageProfileButton.setTitle("프로필 관리", for: .normal)
        manageProfileButton.setTitleColor(.black, for: .normal)
        manageProfileButton.layer.borderWidth = 1
        manageProfileButton.layer.cornerRadius = 5
        manageProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        manageProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        manageProfileButton.isEnabled = true
        view.addSubview(manageProfileButton)
            
        // 프로필 공유
        shareProfileButton.setTitle("프로필 공유", for: .normal)
        shareProfileButton.setTitleColor(.black, for: .normal)
        shareProfileButton.layer.borderWidth = 1
        shareProfileButton.layer.cornerRadius = 5
        shareProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        shareProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        shareProfileButton.isEnabled = true
        view.addSubview(shareProfileButton)
            
        
    }
    
    // 마이페이지 레이아웃 제약조건 설정
    func setupConstraints() {
        // 설정 버튼
        settingsButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(26)
            $0.width.height.equalTo(25)
        }
        
        // 카메라 버튼
        cameraButton.snp.makeConstraints {
            $0.centerY.equalTo(settingsButton)
            $0.trailing.equalToSuperview().offset(-26)
            $0.leading.equalTo(settingsButton.snp.trailing).offset(277)
            $0.width.height.equalTo(25)
        }
            
        // 프로필 사진
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(settingsButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
            $0.width.height.equalTo(80)
        }
            
        // 유저 이름
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
            
        // 팔로워 수
        followerLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        // 팔로잉 수
        followingLabel.snp.makeConstraints {
            $0.top.equalTo(followerLabel)
            $0.leading.equalTo(followerLabel.snp.trailing).offset(10)
        }
            
        // 프로필 관리
        manageProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
            
        // 프로필 공유
        shareProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-26)
            $0.leading.equalTo(manageProfileButton.snp.trailing).offset(14)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
    }
    // 프로필 관리 버튼 누르기 동작
    // Navigation 방식
    @objc func didTapManageProfileButton() {
            let profileManageVC = ProfileManageViewController()
            
            // UINavigationController에서 push 방식으로 화면 전환
            navigationController?.pushViewController(profileManageVC, animated: true)
        }
}
