//
//  profileManageViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/4/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
    
    let profileManageView = ProfileManageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // profileManageView 연결
        let profileManageView = ProfileManageView(frame: self.view.bounds)
        self.view.addSubview(profileManageView)
        self.title = "프로필 관리"
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
                
        // UserDefaults에서 저장된 이메일과 비밀번호 불러오기
        if let savedEmail = UserDefaults.standard.string(forKey: "savedEmail"),
           let savedPassword = UserDefaults.standard.string(forKey: "savedPassword") {
            profileManageView.userEmail.text = savedEmail
            profileManageView.userPassword.text = savedPassword
        }
        
        // 변경 버튼 액션 설정
        profileManageView.onUserEmailButtonTapped = {
            self.toggleTextField(profileManageView.userEmail, button: profileManageView.userEmailButton)
        }
        
        profileManageView.onUserPasswordButtonTapped = {
            self.toggleTextField(profileManageView.userPassword, button: profileManageView.userPasswordButton)
        }
        
        // 뒤로 가기 버튼 설정
        let backBt = UIImage(named: "left_arrow")
        let leftButtonItem = UIBarButtonItem(image: backBt, style: .plain, target: self, action: #selector(backButtonTapped))
        leftButtonItem.tintColor = .black // 버튼 색상을 검정색으로 설정
        navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // ProfileManageViewController에서 navigationBar 보이기
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // 텍스트 필드 수정 활성/비활성화 처리
    private func toggleTextField(_ textField: UITextField, button: UIButton) {
        if button.currentTitle == "변경" {
            textField.isUserInteractionEnabled = true // 텍스트 필드 수정 가능
            button.setTitle("확인", for: .normal)
        } else {
            textField.isUserInteractionEnabled = false // 텍스트 필드 수정 불가능
            button.setTitle("변경", for: .normal)
            
            // 수정된 값 저장
            if textField == profileManageView.userEmail {
                UserDefaults.standard.set(textField.text, forKey: "savedEmail")
            } else if textField == profileManageView.userPassword {
                UserDefaults.standard.set(textField.text, forKey: "savedPassword")
            }
        }
    }
        
    // 뒤로 가기 버튼 눌렀을 때의 동작
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
