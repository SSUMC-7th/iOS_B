//
//  LoginModel.swift
//  Kream
//
//  Created by 한금준 on 9/27/24.
//

import Foundation

struct LoginModel {
    var id: String
    var pwd: String
    
    init(id: String = "", pwd: String = "") {
        self.id = id
        self.pwd = pwd
    }
}
