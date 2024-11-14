//
//  APIClient.swift
//  Kream
//
//  Created by 한금준 on 11/12/24.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    
    private init() {
        let interceptor = AuthorizationInterceptor(kakaoKey: "APP_KEY")
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
            }
        }
}
