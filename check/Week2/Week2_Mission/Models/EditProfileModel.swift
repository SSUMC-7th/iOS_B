//
//  EditProfileModel.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import Foundation

struct EditProfileModel {
    
    var enteredEmail: String?
    var enteredPassword: String?
    var isEmailEdited = false
    var isPasswordEdited = false
    
    mutating public func setEmail(by newEmail: String){
        self.enteredEmail = newEmail
    }
    
    mutating public func setPassword(by newPassword: String){
        self.enteredPassword = newPassword
    }
    
    mutating public func tryEditEmail(){
        
        
        isEmailEdited = true
    }
    
    mutating public func tryEditPassword(){
        
        
        isPasswordEdited = true
    }
}
