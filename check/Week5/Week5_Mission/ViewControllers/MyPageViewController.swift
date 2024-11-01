//
//  MyPageViewController.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import UIKit

class MyPageViewController: UIViewController {
    
    var profileModel = ProfileModel()
    
    lazy var profileView: MyPageView = {
        let view = MyPageView()
        
        view.profileImage.image = UIImage(named: profileModel.getProfileImage())
        
        view.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        view.shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
    }
    
    @objc func editButtonTapped(){
        let editProfileVC = EditProfileViewController()
        editProfileVC.profileModel = profileModel
        self.navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
    @objc func shareButtonTapped(){
        
    }

}
