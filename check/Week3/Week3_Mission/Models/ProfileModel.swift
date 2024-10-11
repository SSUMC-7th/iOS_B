//
//  ProfileModel.swift
//  Week3_Mission
//
//  Created by LEE on 2024/10/10.
//

import Foundation

struct ProfileModel {
    
    let userDefaults = UserDefaults.standard
    
    
    mutating public func setEmail(by newEmail: String){
        
        userDefaults.setValue(newEmail, forKey: "Email")
    }
    
    mutating public func setPassword(by newPassword: String){


        userDefaults.setValue(newPassword, forKey: "Password")

    }
    
    mutating public func setImage(by newImage: String){
        

        userDefaults.setValue(newImage, forKey: "ProfileImage")
    }
    
    public func getEmail() -> String {

        return userDefaults.string(forKey: "Email") ?? ""
    }
    
    public func getPassword() -> String {

        return userDefaults.string(forKey: "Password") ?? ""
    }
    
    public func getProfileImage() -> String {
        return userDefaults.string(forKey: "ProfileImage") ?? "노인사진.png"
    }
}
