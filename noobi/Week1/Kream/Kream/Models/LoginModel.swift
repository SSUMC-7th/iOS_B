//
//  LoginModel.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import Foundation

// 구조체 생성 후, String 타입의 id와 pwd 를 생성
struct LoginModel {
    var id: String
    var pwd: String
    
//    init(id: String = "", pwd: String = "") {
//        self.id = id
//        self.pwd = pwd
//    }
    
    mutating func setId(_ id: String) {
        self.id = id
    }
    
    mutating func setPwd(_ pwd: String) {
        self.pwd = pwd
    }
}
