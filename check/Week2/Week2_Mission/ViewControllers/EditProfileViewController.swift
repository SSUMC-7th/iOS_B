//
//  EditProfileViewController.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import UIKit

class EditProfileViewController: UIViewController {

    private var editProfileModel = EditProfileModel()
    private let editProfileView = EditProfileView()
    
    // MARK: - 라이플 사이클 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view = editProfileView
        
        navigationItem.title = "프로필 관리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        editProfileView.emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        
        editProfileView.passwordButton.addTarget(self, action: #selector(passwordbuttonTapped), for: .touchUpInside)
        
    }
    
    // MARK: - 버튼 터치 이벤트 핸들러
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func emailButtonTapped(){
        
        if editProfileModel.isEmailEdited == true { return }
        
        editProfileModel.tryEditEmail()
        
        editProfileView.emailButton.setTitle("확인", for: .normal)
        
    }
    
    @objc func passwordbuttonTapped(){
        
        if editProfileModel.isPasswordEdited == true { return }
        
        editProfileModel.tryEditPassword()
        
        editProfileView.passwordButton.setTitle("확인", for: .normal)
    }

}
