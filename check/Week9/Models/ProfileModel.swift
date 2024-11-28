//
//  ProfileModel.swift
//  Week3_Mission
//
//  Created by LEE on 2024/10/10.
//

import Foundation

struct ProfileModel {
    
    let userDefaults = UserDefaults.standard
    
    
    mutating func setEmail(by newEmail: String){
        
        userDefaults.setValue(newEmail, forKey: "Email")
    }
    
    mutating func setPassword(by newPassword: String){


        userDefaults.setValue(newPassword, forKey: "Password")

    }
    
    mutating func setImage(by newImage: String){
        
        userDefaults.setValue(newImage, forKey: "ProfileImage")
    }
    
    mutating func setNickname(by newNickname: String){
        
        userDefaults.setValue(newNickname, forKey: "Nickname")

    }
    
    func getEmail() -> String {

        return userDefaults.string(forKey: "Email") ?? ""
    }
    
    func getPassword() -> String {

        return userDefaults.string(forKey: "Password") ?? ""
    }
    
    func getProfileImage() -> String {
        return userDefaults.string(forKey: "ProfileImage") ?? "노인사진.png"
    }
    
    func getNickname() -> String{
        return userDefaults.string(forKey: "Nickname") ?? ""
    }
}
