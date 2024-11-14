//
//  KakaoAPIManager.swift
//  Kream
//
//  Created by 한금준 on 11/13/24.
//

import Foundation
import Alamofire

class KakaoAPIManager {
    
    // 사용자 정보를 요청하는 함수
    func requestKakaoUserInfo(accessToken: String) {
        let url = "https://kapi.kakao.com/v2/user/me"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("사용자 정보 요청 성공: \(value)")
                
                // JSON 파싱 및 닉네임 추출
                if let data = response.data,
                   let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let kakaoAccount = json["kakao_account"] as? [String: Any],
                   let profile = kakaoAccount["profile"] as? [String: Any],
                   let nickname = profile["nickname"] as? String {
                    
                    // 사용자 이름 출력
                    print("닉네임: \(nickname)")
                    
                    // UserDefaults나 UI에 저장/설정
                    UserDefaults.standard.setValue(nickname, forKey: "userName")
                }
                
            case .failure(let error):
                print("사용자 정보 요청 실패: \(error)")
            }
        }
    }
}
