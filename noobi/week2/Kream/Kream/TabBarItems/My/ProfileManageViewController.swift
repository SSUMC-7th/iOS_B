//
//  ProfileManageViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
    

    private let backButton = UIButton()
    private let profileImageView = UIImageView()
    private let profileNameTextField = UITextField()
    private let infoLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let emailChangeButton = UIButton()
    private let passwordChangeButton = UIButton()

    var isEmailEditing = false
    var isPasswordEditing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "프로필 관리"
        
        // 기존 뒤로가기 버튼 변경
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(didTapBackButton))
        backButton.tintColor = .black  // 버튼 색상
        navigationItem.leftBarButtonItem = backButton
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {

        // 프로필 이미지 설정
        profileImageView.image = UIImage(named: "profile")
        profileImageView.layer.cornerRadius = 40
        profileImageView.clipsToBounds = true
        view.addSubview(profileImageView)
           
        // 프로필 이름 TextField 설정
        profileNameTextField.text = "Jeong_iOS"
        profileNameTextField.font = UIFont.systemFont(ofSize: 18)
        profileNameTextField.borderStyle = .roundedRect
        profileNameTextField.textAlignment = .center
        view.addSubview(profileNameTextField)
        
        infoLabel.text = "프로필 정보"
        infoLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(infoLabel)
           
        // 이메일 라벨 설정
        emailLabel.text = "유저 이메일"
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(emailLabel)
    
        emailTextField.text = "example@naver.com"
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.isEnabled = false
        view.addSubview(emailTextField)
           
        // 비밀번호 라벨 설정
        passwordLabel.text = "유저 비밀번호"
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(passwordLabel)
           
        // 비밀번호 TextField 설정
        passwordTextField.text = "****************"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.isEnabled = false
        view.addSubview(passwordTextField)
           
        // 이메일 변경 버튼 설정
        emailChangeButton.setTitle("변경", for: .normal)
        emailChangeButton.setTitleColor(.black, for: .normal)
        emailChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        emailChangeButton.layer.borderWidth = 1
        emailChangeButton.layer.cornerRadius = 5
        emailChangeButton.addTarget(self, action: #selector(didTapEmailChangeButton), for: .touchUpInside)
        view.addSubview(emailChangeButton)
           
        // 비밀번호 변경 버튼 설정
        passwordChangeButton.setTitle("변경", for: .normal)
        passwordChangeButton.setTitleColor(.black, for: .normal)
        passwordChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        passwordChangeButton.layer.borderWidth = 1
        passwordChangeButton.layer.cornerRadius = 5
        passwordChangeButton.addTarget(self, action: #selector(didTapPasswordChangeButton), for: .touchUpInside)
        view.addSubview(passwordChangeButton)
    }

    func setupConstraints() {
        // 프로필 이미지 레이아웃
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(90)
        }
           
        // 프로필 이름 TextField 레이아웃
        profileNameTextField.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        
        // 프로필 정보
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(profileNameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(349)
            $0.height.equalTo(29)
        }
           
        // 이메일 라벨 레이아웃
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
           
        // 이메일 TextField 레이아웃
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalTo(emailChangeButton.snp.leading).offset(-10)
            $0.height.equalTo(40)
        }
           
        // 이메일 변경 버튼 레이아웃
        emailChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(emailTextField)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
        }
           
        // 비밀번호 라벨 레이아웃
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
           
        // 비밀번호 TextField 레이아웃
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalTo(passwordChangeButton.snp.leading).offset(-10)
            $0.height.equalTo(40)
        }
           
        // 비밀번호 변경 버튼 레이아웃
        passwordChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
        }
    }
    // 뒤로가기 버튼 ehdwkr
    // Navigation 방식 전환
    @objc func didTapBackButton() {
            navigationController?.popViewController(animated: true)
        }
    
    @objc func didTapEmailChangeButton() {
            isEmailEditing.toggle() // 상태 변경
            if isEmailEditing {
                // 이메일 초기화
                emailTextField.text = ""
                emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
                emailTextField.isEnabled = true
                emailChangeButton.setTitle("확인", for: .normal)
                emailChangeButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
            } else {
                emailTextField.isEnabled = false
                emailChangeButton.setTitle("변경", for: .normal)
            }
        }
        
        // 비밀번호 변경 버튼 눌렀을 때의 동작
        @objc func didTapPasswordChangeButton() {
            isPasswordEditing.toggle() // 상태 변경
            if isPasswordEditing {
                // 기존 비밀번호 초기화
                passwordTextField.text = ""
                passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
                passwordTextField.isEnabled = true
                passwordChangeButton.setTitle("확인", for: .normal)
                passwordChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            } else {
                passwordTextField.isEnabled = false
                passwordChangeButton.setTitle("변경", for: .normal)
            }
        }
}
