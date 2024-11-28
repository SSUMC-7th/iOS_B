//
//  ViewController.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import UIKit
import SnapKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()
    private let profilemanageView = ProfileManageView()
    private let myView = MyView()
    
    private let kakaoAPIManager = KakaoAPIManager()
    
    // 뷰 연결
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginView()
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.kakaoLoginButton.addTarget(self, action: #selector(didTapKakaoLoginButton), for: .touchUpInside)
        
        // 카카오 로그인 후에 액세스 토큰을 가져온 후 사용자 정보 요청
        let accessToken = "b0-gPDlabfwglY-l8oPfbFC9FyRbC74tAAAAAQorDSAAAAGTJfGTT1XuKbObXTiX" // Kakao SDK를 통해 얻은 액세스 토큰
        kakaoAPIManager.requestKakaoUserInfo(accessToken: accessToken)
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    private func setupLoginView() {
        // 현재 뷰의 서브 뷰
        view.addSubview(loginView)
        // Auto Layout 사용
        loginView.translatesAutoresizingMaskIntoConstraints = false
        // 제약조건 활성화 - 부모 view의 크기에 맞게 고정
        loginView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    @objc
    func loginButtonTapped() {
        guard let id = loginView.emailTextField.text, !id.isEmpty else { return }
        guard let password = loginView.passwordTextField.text, !password.isEmpty else { return }
        
        // 모델을 통해 텍스트 저장
        loginModel.saveUserId(id)
        loginModel.saveUserPwd(password)
        
        // ProfileManageViewController로 이메일과 비밀번호를 전달
        let profileManageView = ProfileManageView()
        profileManageView.emailTextField.text = id
        profileManageView.passwordTextField.text = password
        
        // 로그인 성공 시 메인 TabBarController로 전환
        // Modal 방식
        let mainpageViewController = MainPageViewController()
        
        mainpageViewController.view.backgroundColor = .white
        mainpageViewController.modalPresentationStyle = .fullScreen
        
        present(mainpageViewController, animated: true, completion: nil)
    }
    
    @objc func didTapKakaoLoginButton(_ sender: UIButton) {
        
        //카카오톡 실행 가능 여부 확인 후 로그인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과 전달.
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                } else if let oauthToken = oauthToken {
                    print("loginWithKakaoTalk() success.")
                    
                    _ = oauthToken
                    
                    // 액세스 토큰 가져오기
                    let accessToken = oauthToken.accessToken
                    // KakaoAPIManager를 통해 사용자 정보 요청
                    self.kakaoAPIManager.requestKakaoUserInfo(accessToken: accessToken)
                    
                    // 로그인 성공 시 메인 TabBarController로 전환
                    // Modal 방식
                    let mainpageViewController = MainPageViewController()
                    
                    mainpageViewController.view.backgroundColor = .white
                    mainpageViewController.modalPresentationStyle = .fullScreen
                    
                    self.present(mainpageViewController, animated: true, completion: nil)
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else if let oauthToken = oauthToken {
                    print("loginWithKakaoAccount() success.")
                    
                    _ = oauthToken
                    
                    // 액세스 토큰 가져오기
                    let accessToken = oauthToken.accessToken
                    
                    // KakaoAPIManager를 통해 사용자 정보 요청
                    self.kakaoAPIManager.requestKakaoUserInfo(accessToken: accessToken)
                    
                    // 로그인 성공 시 메인 TabBarController로 전환
                    // Modal 방식
                    let mainpageViewController = MainPageViewController()
                    
                    mainpageViewController.view.backgroundColor = .white
                    mainpageViewController.modalPresentationStyle = .fullScreen
                    
                    self.present(mainpageViewController, animated: true, completion: nil)
                }
            }
        }
    }
}
