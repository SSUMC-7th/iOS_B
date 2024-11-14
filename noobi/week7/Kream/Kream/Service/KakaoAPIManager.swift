//
//  KakaoAPIManager.swift
//  Kream
//
//  Created by 한금준 on 11/13/24.
//

import Foundation
import Alamofire

// 카카오 API와 통신하는 기능을 담당하는 클래스
class KakaoAPIManager {
    
    // 사용자 정보를 요청하는 함수
    func requestKakaoUserInfo(accessToken: String) {
        // 사용자 정보를 요청할 Kakao API URL
        let url = "https://kapi.kakao.com/v2/user/me"
        
        // 요청에 포함할 헤더 설정 (Bearer 인증 방식)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)" // 액세스 토큰을 Authorization 헤더에 추가
        ]
        
        // Alamofire를 사용해 GET 요청을 보냄
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            // 요청 결과를 처리하는 스위치 구문
            switch response.result {
            case .success(let value):
                // 요청이 성공했을 때
                print("사용자 정보 요청 성공: \(value)")
                
                // JSON 데이터를 파싱하여 닉네임 추출
                if let data = response.data, // 응답 데이터를 가져옴
                   let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], // JSON 데이터 파싱
                   let kakaoAccount = json["kakao_account"] as? [String: Any], // 'kakao_account' 객체 추출
                   let profile = kakaoAccount["profile"] as? [String: Any], // 'profile' 객체 추출
                   let nickname = profile["nickname"] as? String { // 닉네임 추출
                    
                    // 사용자 닉네임 출력
                    print("닉네임: \(nickname)")
                    
                    // 닉네임을 UserDefaults에 저장
                    UserDefaults.standard.setValue(nickname, forKey: "userName")
                }
                
            case .failure(let error):
                // 요청이 실패했을 때
                print("사용자 정보 요청 실패: \(error)")
            }
        }
    }
}
