//
//  APIClient.swift
//  Kream
//
//  Created by 한금준 on 11/12/24.
//

import Foundation
import Alamofire

// API 요청을 담당하는 클라이언트 클래스
final class APIClient {
    
    // APIClient의 싱글톤 인스턴스 생성
    static let shared = APIClient()
    
    // Alamofire의 Session 객체, 요청 시 인터셉터를 포함
    private let session: Session
    
    // 초기화 메서드 (private으로 설정하여 외부에서 인스턴스 생성 불가)
    private init() {
        // AuthorizationInterceptor를 사용해 요청에 인증 헤더를 추가
        let interceptor = AuthorizationInterceptor(kakaoKey: "515f6312f244f91f5fa22b0abbde1e59")
        // Session 객체를 인터셉터와 함께 초기화
        session = Session(interceptor: interceptor)
    }
    
    // API 요청을 보내는 함수 (제네릭 타입 T는 Codable을 따름)
    public func request<T: Codable>(
        _ url: String, // 요청할 URL
        method: HTTPMethod, // HTTP 메서드 (GET, POST 등)
        parameters: Parameters? = nil, // 요청에 사용할 매개변수 (기본값은 nil)
        completion: @escaping (Result<T, Error>) -> Void // 요청 결과를 반환하는 클로저
    ) {
        // Session 객체를 사용해 요청을 보냄
        session.request(url, method: method, parameters: parameters)
            .validate() // 응답을 검증 (상태 코드 및 데이터 형식을 확인)
            .responseDecodable(of: T.self) { response in // 응답을 디코딩하여 처리
                // 응답 결과를 확인
                switch response.result {
                case .success(let value):
                    // 요청 성공 시 디코딩된 값을 반환
                    completion(.success(value))
                case .failure(let error):
                    // 요청 실패 시 오류를 반환
                    completion(.failure(error))
                }
        }
    }
}
