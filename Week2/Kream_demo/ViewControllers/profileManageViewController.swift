//
//  profileManageViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/4/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // profileManageView 연결
        let profileManageView = ProfileManageView(frame: self.view.bounds)
        self.view.addSubview(profileManageView)
        self.title = "프로필 관리"
    
        self.navigationController?.setNavigationBarHidden(false, animated: false)

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
    
    // 뒤로 가기 버튼 눌렀을 때의 동작
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
