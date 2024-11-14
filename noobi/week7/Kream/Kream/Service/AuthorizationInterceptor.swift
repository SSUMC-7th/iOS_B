//
//  AuthorizationInterceptor.swift
//  Kream
//
//  Created by 한금준 on 11/12/24.
//

import Foundation
import Alamofire

// API 요청 시 인증 헤더를 추가하고 요청을 인터셉트하는 클래스
class AuthorizationInterceptor: RequestInterceptor {
    
    // 카카오 API 키를 저장하는 속성
    private let kakaoKey: String
    
    // 초기화 메서드로, 카카오 API 키를 전달받아 저장
    init(kakaoKey: String) {
        self.kakaoKey = kakaoKey
    }
    
    // 요청을 수정하여 인증 헤더를 추가하는 메서드
    // adapt 메서드는 요청이 보내지기 전에 호출됩니다.
    func adapt(
        _ urlRequest: URLRequest, // 원본 URL 요청
        for session: Session, // Alamofire 세션
        completion: @escaping (Result<URLRequest, any Error>) -> Void // 수정된 요청을 반환하는 클로저
    ) {
        var request = urlRequest
        // Authorization 헤더에 "KakaoAK {API_KEY}" 형식의 값 추가
        request.setValue("KakaoAK \(kakaoKey)", forHTTPHeaderField: "Authorization")
        // 수정된 요청을 성공으로 반환
        completion(.success(request))
    }
    
    // 요청 실패 시 재시도 여부를 결정하는 메서드
    // retry 메서드는 요청이 실패한 후 호출
    func retry(
        _ request: Request, // 실패한 요청
        for session: Session, // Alamofire 세션
        dueTo error: any Error, // 요청 실패 원인인 오류
        completion: @escaping (RetryResult) -> Void // 재시도 결과를 반환하는 클로저
    ) {
        // 재시도하지 않도록 설정
        completion(.doNotRetry)
    }
}
