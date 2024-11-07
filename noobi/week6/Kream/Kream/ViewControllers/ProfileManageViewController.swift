//
//  ProfileManageViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit

import SnapKit

class ProfileManageViewController: UIViewController {
    // 전달받을 사진
    var profileImage: UIImage?
    
    // 전달받을 이메일과 비밀번호
    var email: String?
    var password: String?
    
    // ProfileManageView 생성
    private let profileManageView = ProfileManageView()
        
    var isEmailEditing = false
    var isPasswordEditing = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "프로필 관리"
        
        // 네비게이션 바의 뒤로가기 버튼
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(didTapBackButton))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
        // ProfileManageView 설정
        view.addSubview(profileManageView)
        profileManageView.frame = view.bounds
        
        // 전달받은 이미지를 UIImageView에 설정
        if let profileImage = profileImage {
            profileManageView.profileImageView.image = profileImage
        }
        
        // UserDefaults에서 이메일과 비밀번호 불러오기
        if let savedEmail = UserDefaults.standard.string(forKey: "userId"),
           let savedPassword = UserDefaults.standard.string(forKey: "userPwd") {
                profileManageView.emailTextField.text = savedEmail
                profileManageView.passwordTextField.text = savedPassword
        }
        
        // 텍스트 필드를 처음에는 수정할 수 없도록 설정
        profileManageView.emailTextField.isUserInteractionEnabled = false
        profileManageView.passwordTextField.isUserInteractionEnabled = false
        
        // 버튼 동작 연결
        profileManageView.emailChangeButton.addTarget(self, action: #selector(didTapEmailChangeButton), for: .touchUpInside)
        profileManageView.passwordChangeButton.addTarget(self, action: #selector(didTapPasswordChangeButton), for: .touchUpInside)
    }
        
    // 뒤로가기 버튼 동작
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
        
    // 이메일 변경 버튼 눌렀을 때의 동작
    @objc func didTapEmailChangeButton() {
        isEmailEditing.toggle()
        if isEmailEditing {
            // 텍스트 필드를 수정 가능하게 만듦
            profileManageView.emailTextField.text = ""
            profileManageView.emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
            profileManageView.emailTextField.isUserInteractionEnabled = true
            profileManageView.emailChangeButton.setTitle("확인", for: .normal)
            profileManageView.emailChangeButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        } else {
            // 텍스트 필드를 수정 불가능하게 만듦
            profileManageView.emailTextField.isUserInteractionEnabled = false
            profileManageView.emailChangeButton.setTitle("변경", for: .normal)
            
            // UserDefaults에 저장
            if let updatedEmail = profileManageView.emailTextField.text {
                UserDefaults.standard.setValue(updatedEmail, forKey: "userId")
            }
        }
    }
        
    // 비밀번호 변경 버튼 눌렀을 때의 동작
    @objc func didTapPasswordChangeButton() {
        isPasswordEditing.toggle()
        if isPasswordEditing {
            profileManageView.passwordTextField.isUserInteractionEnabled = true
            profileManageView.passwordTextField.text = ""
            profileManageView.passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
            profileManageView.passwordChangeButton.setTitle("확인", for: .normal)
            profileManageView.passwordChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        } else {
            // 텍스트 필드를 수정 불가능하게 만듦
            profileManageView.passwordTextField.isUserInteractionEnabled = false
            profileManageView.passwordChangeButton.setTitle("변경", for: .normal)
            
            // UserDefaults에 저장
            if let updatedPassword = profileManageView.passwordTextField.text {
                UserDefaults.standard.setValue(updatedPassword, forKey: "userPwd")
            }
        }
    }
}
