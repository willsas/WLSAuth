//
//  SocialMediaLoginModel.swift
//  WLSAuth
//
//  Created by Willa on 29/06/21.
//

import Foundation

struct SocialMediaLoginModel{
    var email: String
    var fullName: String
    var uid: String
    var provider: String
    var accessToken: String?
}


extension SocialMediaLoginModel{
    static func facebook(_ dict: Dictionary<String, Any>) -> SocialMediaLoginModel{
        let email = dict["email"] as! String
        let fullName = dict["name"] as! String
        let id = dict["id"] as! String
        
        return SocialMediaLoginModel(email: email, fullName: fullName, uid: id, provider: "facebook", accessToken: nil)
    }
}
