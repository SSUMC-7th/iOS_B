//
//  KakaoLoginManager.swift
//  Week7_Mission
//
//  Created by LEE on 2024/11/15.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

final class KakaoLoginManager{
    
    static let shared = KakaoLoginManager()
    private init() {}
    
//    func tryLogin() -> Bool{
//        
//        var isSuccess = false
//        if UserApi.isKakaoTalkLoginAvailable(){
//            UserApi.shared.loginWithKakaoTalk{ (oauthToken, error) in
//                if let error = error{
//                    print("카카오톡 로그인 에러 : \(error)")
//                    return
//                }else if let accessToken = oauthToken?.accessToken{
//                    print("카카오톡 로그인 성공, 토큰 :\(accessToken)")
//                    isSuccess = true
//                }
//            }
//        }else{
//            UserApi.shared.loginWithKakaoAccount{ (oauthToken, error) in
//                if let error = error{
//                    print("카카오계정 로그인 에러 : \(error)")
//                    return
//                }else if let accessToken = oauthToken?.accessToken{
//                    print("카카오계정 로그인 성공, 토큰 :\(accessToken)")
//                    isSuccess = true
//                }
//            }
//        }
//        
//        return isSuccess
//    }
    
    func tryLogin(completion: @escaping (Bool) -> Void) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print("카카오톡 로그인 에러 : \(error)")
                    completion(false)
                    return
                } else if let accessToken = oauthToken?.accessToken {
                    print("카카오톡 로그인 성공, 토큰 :\(accessToken)")
                    completion(true)
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("카카오계정 로그인 에러 : \(error)")
                    completion(false)
                    return
                } else if let accessToken = oauthToken?.accessToken {
                    print("카카오계정 로그인 성공, 토큰 :\(accessToken)")
                    completion(true)
                }
            }
        }
    }
    
//    func getUserNickname() -> String? {
//        var userNickname: String? = nil
//        
//        UserApi.shared.me { (user, error) in
//            if let error = error{
//                print("사용자 정보 요청 에러 : \(error)")
//                return
//            }
//            
//            if let nickname = user?.kakaoAccount?.profile?.nickname{
//                print("사용자 정보 요청 성공, 닉네임 : \(nickname)")
//                userNickname = nickname
//            }
//        }
//        
//        return userNickname
//    }
    
    func getUserNickname(completion: @escaping (String?) -> Void) {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print("사용자 정보 요청 에러 : \(error)")
                completion(nil)
                return
            }
            
            if let nickname = user?.kakaoAccount?.profile?.nickname {
                print("사용자 정보 요청 성공, 닉네임 : \(nickname)")
                completion(nickname)
            } else {
                completion(nil)
            }
        }
    }

}
