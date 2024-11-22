//
//  MyViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/3/24.
//

import UIKit

class MyViewController: UIViewController {
    
    var myView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // MyView 연결
        myView = MyView(frame: self.view.bounds)
        self.view.addSubview(myView)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // 버튼 액션 추가
        myView.profileManageButton.addTarget(self, action: #selector(profileManageButtonTapped), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        // 카카오 닉네임 불러오기~
        if let nickname = KeychainManager.shared.load(key: "userNickname") {
            myView.usernameLabel.text = nickname
            print("키체인에서 닉네임 불러오기 체크")
        }
    }

    @objc private func profileManageButtonTapped() {
        let profileManageVC = ProfileManageViewController()
        profileManageVC.profileManageView.setProfileImage(myView.profileImageView.image) // 이미지 전달
        self.navigationController?.pushViewController(profileManageVC, animated: true)
    }
}
