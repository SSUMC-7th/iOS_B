//
//  UserDefaultsModel.swift
//  UMC_week3_practice
//
//  Created by 황상환 on 10/7/24.
//

import Foundation

// struct가 아닌 class로 작성하는 이유는 UserDefaults 처럼 글로벌 상태를 유지해야 하는 데이터는
// 데이터 참조 타입으로 관리해야 효율적인 사용이 가능해서.

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
    
    /// 유저가 입력한 텍스트 값을 UserDefaults에 저장합니다.
    /// - Parameter text: 유저가 입력한 텍스트 값
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    
    /// UserDefaults에 저장된 값을 불러옵니다.
    /// - Returns: 저장된 값 String으로 return
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
}
