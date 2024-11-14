//
//  SearchModel.swift
//  Kream
//
//  Created by 한금준 on 11/12/24.
//

import Foundation

class KakaoLoginModel {
    
    // Keychain에 토큰 값과 이름을 저장하는 함수
    @discardableResult
    func saveToKeychain(tokenValue: String, name: String) -> OSStatus {
        // 저장할 토큰 값을 Data 타입으로 변환
        let data = tokenValue.data(using: .utf8)!
        
        // Keychain에 저장할 항목의 속성을 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword, // 데이터의 유형을 일반 비밀번호로 설정
            kSecAttrAccount as String: name,               // 사용자 이름 
            kSecValueData as String: data                  // 저장할 토큰 값
        ]
        
        // Keychain에 동일한 항목이 있으면 삭제하여 중복 방지
        SecItemDelete(query as CFDictionary)
        
        // 새로운 데이터 저장 시도 및 상태 반환
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    // Keychain에서 데이터를 불러오는 함수
    func loadFromKeychain(name: String) -> String? {
        // Keychain에서 데이터를 검색할 항목의 속성을 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword, // 데이터의 유형을 일반 비밀번호로 설정
            kSecAttrAccount as String: name,               // 검색할 계정을 지정
            kSecReturnData as String: true,                // 반환할 데이터로 Data 타입을 요청
            kSecMatchLimit as String: kSecMatchLimitOne    // 하나의 항목만 검색하도록 제한
        ]
        
        // Keychain에서 항목 검색
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        // 검색이 실패하면 nil 반환
        guard status == errSecSuccess else { return nil }
        
        // 검색된 데이터를 Data 타입으로 변환 후, 문자열로 변환
        guard let data = item as? Data,
              let tokenValue = String(data: data, encoding: .utf8) else { return nil }
        
        // 문자열로 변환된 토큰 값을 반환
        return tokenValue
    }
}
