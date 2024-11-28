//
//  UserTargetType.swift
//  Kream
//
//  Created by 한금준 on 11/20/24.
//

import Foundation
import Moya

/// 서버 통신과 관련한 내용
enum UserSearchType {
    case search(query: String)
}

/// extention 활용해 TargetType 프로토콜 추가
extension UserSearchType: TargetType {
    var baseURL: URL {
            guard let baseURL = URL(string: "https://dummyjson.com") else {
                fatalError("Error: Invalid URL")
            }
            
            return baseURL
        }
    
    var path: String {
        switch self {
        case .search:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
            switch self {
            case .search:
                return .get
            }
        }
    
    /// 네트워크 요청에 사용할 데이터를 정의하며, search API 요청을 위해 query 파라미터를 URL에 포함시킴
    /// 서버로 검색어를 전달하고, 관련 데이터를 요청
    var task: Moya.Task {
            switch self {
            case .search(let query):
                return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
            }
        }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
