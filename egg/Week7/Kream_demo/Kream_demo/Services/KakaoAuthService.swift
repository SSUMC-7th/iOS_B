//
//  KakaoLoginService.swift.swift
//  Kream_demo
//
//  Created by 황상환 on 11/14/24.
//

import KakaoSDKUser
import KakaoSDKAuth

class KakaoAuthService {
    static let shared = KakaoAuthService()
    private init() {}
    
    func handleKakaoLogin(completion: @escaping (Result<String, Error>) -> Void) {
        print("카카오 로그인 시작")
        if UserApi.isKakaoTalkLoginAvailable() {
            print("카카오톡 앱으로 로그인 시도")
            UserApi.shared.loginWithKakaoTalk { [weak self] (oauthToken, error) in
                if let error = error {
                    print("카카오톡 로그인 에러: \(error)")
                    completion(.failure(error))
                    return
                }
                
                if let token = oauthToken {
                    print("카카오톡 로그인 성공, 토큰: \(token.accessToken)")
                    self?.getUserInfo(completion: completion)
                }
            }
        } else {
            print("카카오 계정으로 로그인 시도")
            UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                if let error = error {
                    print("카카오 계정 로그인 에러: \(error)")
                    completion(.failure(error))
                    return
                }
                
                if let token = oauthToken {
                    print("카카오 계정 로그인 성공, 토큰: \(token.accessToken)")
                    self?.saveToken(token)
                    self?.getUserInfo(completion: completion)
                }
            }
        }
    }
    
    // 액세스 토큰 저장
    private func saveToken(_ token: OAuthToken) {
        let accessTokenSaveResult = KeychainManager.shared.save(key: "kakaoAccessToken", value: token.accessToken)
        if accessTokenSaveResult == errSecSuccess {
            print("액세스 토큰 저장 성공")
        } else {
            print("액세스 토큰 저장 실패.. : \(accessTokenSaveResult)")
        }
        
        // 리프레시 토큰 저장
        let refreshTokenSaveResult = KeychainManager.shared.save(key: "kakaoRefreshToken", value: token.refreshToken)
        if refreshTokenSaveResult == errSecSuccess {
            print("리프레시 토큰 저장 성공")
        } else {
            print("리프레시 토큰 저장 실패.. : \(refreshTokenSaveResult)")
        }
    }
    
    private func handleLoginResult(oauthToken: OAuthToken?, error: Error?, completion: @escaping (Result<String, Error>) -> Void) {
        if let error = error {
            print("로그인 에러 발생: \(error)")
            completion(.failure(error))
            return
        }
        
        print("토큰 발급 성공: \(oauthToken?.accessToken ?? "")")
        self.getUserInfo(completion: completion)
    }
    
    private func getUserInfo(completion: @escaping (Result<String, Error>) -> Void) {
        print("사용자 정보 요청")
        UserApi.shared.me { (user, error) in
            if let error = error {
                print("사용자 정보 요청 실패: \(error)")
                completion(.failure(error))
                return
            }
            
            if let nickname = user?.kakaoAccount?.profile?.nickname {
                print("사용자 정보 요청 성공 - 닉네임: \(nickname)")
                // 키체인에 저장하고 결과 확인
                let saveResult = KeychainManager.shared.save(key: "userNickname", value: nickname)
                
                if saveResult == errSecSuccess {
                    print("키체인 저장 성공")
                    completion(.success(nickname))
                } else {
                    print("키체인 저장 실패: \(saveResult)")
                    completion(.failure(NSError(domain: "", code: Int(saveResult),
                        userInfo: [NSLocalizedDescriptionKey: "키체인 저장 실패"])))
                }
            }
        }
    }
}
