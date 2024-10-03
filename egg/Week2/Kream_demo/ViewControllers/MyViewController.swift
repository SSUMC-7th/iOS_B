//
//  MyViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/3/24.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MyView 연결
        let myView = MyView(frame: self.view.bounds)
        self.view.addSubview(myView)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 버튼이 눌렸을 때 처리하는 클로저 설정
        myView.onProfileManageButtonTapped = {
            let profileManageVC = ProfileManageViewController()
            self.navigationController?.pushViewController(profileManageVC, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // MyViewController에서 navigationBar를 계속 숨기기
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

    
    
}
