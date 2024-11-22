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
        profileManageView.userEmailButton.addTarget(self, action: #selector(userEmailButtonTapped), for: .touchUpInside)
        profileManageView.userPasswordButton.addTarget(self, action: #selector(userPasswordButtonTapped), for: .touchUpInside)
        
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
    
    // 이메일 버튼 동작
    @objc private func userEmailButtonTapped() {
        print("이메일 변경 버튼 눌림")
        if profileManageView.userEmailButton.currentTitle == "변경" {
            print("이메일 변경임")
            profileManageView.userEmail.isUserInteractionEnabled = true
            profileManageView.userEmailButton.setTitle("확인", for: .normal)
        } else {
            print("이메일 확인임")
            profileManageView.userEmail.isUserInteractionEnabled = false
            profileManageView.userEmailButton.setTitle("변경", for: .normal)
            
            // 수정된 이메일을 UserDefaults에 저장
            UserDefaults.standard.set(profileManageView.userEmail.text, forKey: "savedEmail")
        }
    }
    
    // 비밀번호 버튼 동작
    @objc
    private func userPasswordButtonTapped() {
        print("비밀번호 변경 버튼 눌림")
        if profileManageView.userPasswordButton.currentTitle == "변경" {
            profileManageView.userPassword.isUserInteractionEnabled = true
            profileManageView.userPasswordButton.setTitle("확인", for: .normal)
        } else {
            profileManageView.userPassword.isUserInteractionEnabled = false
            profileManageView.userPasswordButton.setTitle("변경", for: .normal)
            
            // 수정된 비밀번호를 UserDefaults에 저장
            UserDefaults.standard.set(profileManageView.userPassword.text, forKey: "savedPassword")
        }
    }
    
    // 뒤로 가기 버튼 눌렀을 때의 동작
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
