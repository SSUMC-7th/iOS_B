//
//  MyViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit

class MyViewController: UIViewController {
    
    // ProfileView 생성
    private let myView = MyView()
    
    var profileImage: UIImage?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // 뷰 추가 및 레이아웃 설정
        view.addSubview(myView)
        myView.frame = view.bounds
            
        // 버튼 동작 구현
        myView.manageProfileButton.addTarget(self, action: #selector(didTapManageProfileButton), for: .touchUpInside)
        
        // MyView()의 UIImageView에 이미지 설정
        profileImage = UIImage(named: "profile")
        myView.setProfileImage(profileImage)
    }
        
    // 프로필 관리 버튼 눌렀을 때 동작
    @objc func didTapManageProfileButton() {
        let profileManageVC = ProfileManageViewController()
        
        // ProfileManageViewController()에 이미지 직접 전달 방식
        profileManageVC.profileImage = self.profileImage  // 이미지 전달
        // UINavigationController에서 push 방식으로 화면 전환
        navigationController?.pushViewController(profileManageVC, animated: true)
    }
}
