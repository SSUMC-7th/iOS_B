//
//  SearchService.swift
//  Kream_demo
//
//  Created by 황상환 on 11/20/24.
//

import Foundation
import Moya

enum SearchService {
    case search(query: String)
}

extension SearchService: TargetType {
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .search(let query):
            return .requestParameters(
                parameters: ["q": query],
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

