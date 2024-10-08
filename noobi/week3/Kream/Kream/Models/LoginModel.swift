//
//  LoginModel.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import Foundation

// 구조체 생성 후, String 타입의 id와 pwd 를 생성
class LoginModel {
    
    private let userId = UserDefaults.standard
    private let userPwd = UserDefaults.standard
    private let userIdKey: String = "userId"
    private let userPwdKey: String = "userPwd"
    
    // 유저가 입력한 id 값을 UserDefaults에 저장.
    // - Parameter id: 유저가 입력한 텍스트 값
    public func saveUserId(_ id: String) {
        userId.set(id, forKey: userIdKey)
    }
    // 유저가 입력한 pwd 값을 UserDefaults에 저장.
    // - Parameter pwd: 유저가 입력한 텍스트 값
    public func saveUserPwd(_ pwd: String) {
        userPwd.set(pwd, forKey: userPwdKey)
    }
    /// UserDefaults에 저장된 값을 불러오기
    //  - Returns: 저장된 값 String으로 return
    public func loadUserId() -> String? {
        return userId.string(forKey: userIdKey)
    }
    // UserDefaults에 저장된 값을 불러오기.
    // - Returns: 저장된 값 String으로 return
    public func loadUserPwd() -> String? {
        return userPwd.string(forKey: userPwdKey)
    }
    
}
