//
//  MyViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit
import KakaoSDKUser

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
        
//        loadNicknameFromKeychain()
        
        // 사용자 정보를 가져오는 함수 호출
//        fetchKakaoUserInfo()
        // UserDefaults에서 사용자 이름 가져오기
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            myView.usernameLabel.text = userName
        } else {
            myView.usernameLabel.text = "Jeong_iOS" // 기본값
        }
    }
        
    // 프로필 관리 버튼 눌렀을 때 동작
    @objc func didTapManageProfileButton() {
        let profileManageVC = ProfileManageViewController()
        
        // ProfileManageViewController()에 이미지 직접 전달 방식
        profileManageVC.profileImage = self.profileImage  // 이미지 전달
        // UINavigationController에서 push 방식으로 화면 전환
        navigationController?.pushViewController(profileManageVC, animated: true)
    }
    
//    // 사용자 정보를 가져오는 함수
//    private func fetchKakaoUserInfo() {
//        UserApi.shared.me() { [weak self] (user, error) in
//            if let error = error {
//                // 오류가 발생했을 경우 처리
//                print("사용자 정보 가져오기 실패: \(error.localizedDescription)")
//            } else {
//                // 사용자 정보 가져오기 성공
//                print("me() success.")
//                
//                // 사용자 정보 처리
//                if let user = user {
//                    if let nickname = user.kakaoAccount?.profile?.nickname {
//                        // MyView의 userNameLabel에 닉네임 설정
//                        self?.myView.usernameLabel.text = nickname
//                    } else {
//                        print("닉네임이 없습니다.")
//                    }
//                }
//            }
//        }
//    }
    
//    private func loadNicknameFromKeychain() {
//            if let userName = KeychainManager.shared.load(for: "kakao_nickname") {
//                myView.usernameLabel.text = userName
//            } else {
//                myView.usernameLabel.text = "닉네임 없음"
//            }
//        }
}
