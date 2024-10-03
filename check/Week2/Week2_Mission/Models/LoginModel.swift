//
//  LoginModel.swift
//  Week1_Mission
//
//  Created by LEE on 2024/09/28.
//

import Foundation


struct LoginModel {
    
    var enteredEmail: String?
    var enteredPassword: String?
    
    mutating public func setEmail(by newEmail: String){
        self.enteredEmail = newEmail
    }
    
    mutating public func setPassword(by newPassword: String){
        self.enteredPassword = newPassword
    }
    
}
