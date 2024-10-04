//
//  MyPageViewController.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import UIKit

class MyPageViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileView = MyPageView()
        profileView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        
        view = profileView
        
    }
    
    @objc func editButtonTapped(){
        self.navigationController?.pushViewController(EditProfileViewController(), animated: true)
    }


}
