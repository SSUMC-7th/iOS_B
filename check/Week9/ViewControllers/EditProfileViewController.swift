//
//  EditProfileViewController.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    
    var profileModel : ProfileModel?
    
    var isEmailEdited = false
    var isPasswordEdited = false
    private lazy var editProfileView : EditProfileView = {
        let editProfileView = EditProfileView()
        
        if let profileImageName = profileModel?.getProfileImage(){
            editProfileView.profileImage.image = UIImage(named: profileImageName)
        }
        
        if let email = profileModel?.getEmail(){
            editProfileView.emailTextField.placeholder = email
        }
        
        if let password = profileModel?.getPassword(){
            editProfileView.passwordTextField.placeholder = password
        }
        
        
        editProfileView.emailTextField.isUserInteractionEnabled = false
        editProfileView.passwordTextField.isUserInteractionEnabled = false
        
        editProfileView.emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        editProfileView.passwordButton.addTarget(self, action: #selector(passwordbuttonTapped), for: .touchUpInside)
        
        return editProfileView
    }()
    
    // MARK: - 라이플 사이클 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = editProfileView

        navigationItem.title = "프로필 관리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        
        
    }
    
    // MARK: - 버튼 터치 이벤트 핸들러
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func emailButtonTapped(){
        
        // 변경 완료
        if !isEmailEdited{
            editProfileView.emailButton.setTitle("확인", for: .normal)
            editProfileView.emailTextField.isUserInteractionEnabled = true
            
        }else{
            editProfileView.emailButton.setTitle("변경", for: .normal)
            profileModel?.setEmail(by: editProfileView.emailTextField.text!)
            editProfileView.emailTextField.isUserInteractionEnabled = false
            editProfileView.emailTextField.placeholder = profileModel?.getEmail()
        }
        
        isEmailEdited.toggle()
    }
    
    @objc func passwordbuttonTapped(){
        
        // 변경 완료
        if !isPasswordEdited{
            editProfileView.passwordButton.setTitle("확인", for: .normal)
            editProfileView.passwordTextField.isUserInteractionEnabled = true
        
        }else{
            editProfileView.passwordButton.setTitle("변경", for: .normal)
            profileModel?.setPassword(by: editProfileView.passwordTextField.text!)
            editProfileView.passwordTextField.isUserInteractionEnabled = false
            editProfileView.passwordTextField.placeholder = profileModel?.getPassword()


        }
        
        isPasswordEdited.toggle()
    }

}
