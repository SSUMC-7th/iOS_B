//
//  SearchModel.swift
//  Kream
//
//  Created by 한금준 on 11/12/24.
//

import Foundation

//struct KakaoLoginModel: Codable {
//    let documents: [DetailDocument]
//}
//
//struct DetailDocument: Codable {
//    let client_id: String
//    let redirect_uri: String
//    let response_type: String
//}

class KakaoLoginModel {
    
    @discardableResult
    func saveToKeychain(tokenValue: String, name: String) -> OSStatus {
        // 저장할 token값과 이름 포함한 쿼리 구성
        let data = tokenValue.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: name,
            kSecValueData as String: data
        ]
        
        // 기존 항목이 있으면 삭제
        SecItemDelete(query as CFDictionary)
        
        // 새로운 데이터 저장
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    // Keychain에서 데이터를 불러오는 함수
    func loadFromKeychain(name: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: name,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else { return nil }
        
        guard let data = item as? Data,
              let tokenValue = String(data: data, encoding: .utf8) else { return nil }
        
        return tokenValue
    }
}
