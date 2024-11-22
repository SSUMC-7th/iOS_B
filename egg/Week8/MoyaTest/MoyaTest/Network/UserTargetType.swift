//
//  UserTargetType.swift
//  MoyaTest
//
//  Created by 황상환 on 11/19/24.
//

import Foundation
import Moya

enum UserTargetType {
    case getAllUsers
    case postFile(Image: Data)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://api.escuelajs.co") else {
            fatalError("Error: Invaild URL")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getAllUsers:
            return "/api/v1/users"
        case .postFile:
            return "/api/v1/files/upload"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllUsers:
            return .get
        case .postFile:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllUsers:
            return .requestPlain
        case let .postFile(imageData):
            let formData = MultipartFormData(
                provider: .data(imageData),
                name: "file",
                fileName: "jokeBear",
                mimeType: "image/png"
                
            )
            
            return .uploadMultipart([formData])
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllUsers:
            return ["Content-Type" : "application/json"]
        case .postFile:
            return ["Content-Type" : "multipart/form-data"]
        }
    }
    
}
