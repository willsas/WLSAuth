//
//  FacebookService.swift
//  ios-gox
//
//  Created by Willa on 11/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin

enum FBLoginError: Error {
    case canceled
    case failed
    case logOut
    case other(String)
    case noUserID
}

struct FacebookLoginService: SocialMediaLoginService {
    
    
    var type: SocialMediaType = .facebook
    
    var loginManager: LoginManager = LoginManager()
    
    func getUserData(completion: @escaping (Result<SocialMediaLoginModel, Error>) -> Void){
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email, gender"]).start(completionHandler: { (connection, result, error) -> Void in
                DispatchQueue.main.async {
                    if (error == nil){
                        if let dict = result as? [String : AnyObject]{
                            completion(.success(SocialMediaLoginModel.facebook(dict)))
                        }else if let err = error{
                            completion(.failure(err))
                        }
                    }else if let err = error{
                        completion(.failure(err))
                    }
                }
                
            })
        }else{
            completion(.failure(FBLoginError.logOut))
        }
    }
    
    func loginManager(viewController: UIViewController, completion: @escaping (Result<SocialMediaLoginModel, Error>) -> Void){
        loginManager.logOut()
        loginManager.logIn(permissions:[ .publicProfile, .email ], viewController: viewController) { loginResult in
            DispatchQueue.main.async {
                switch loginResult {
                case .failed(let err):
                    completion(.failure(err))
                case .cancelled:
                    completion(.failure(WLSAuthError.other("Login Cancelled")))
                    print("Facebook login cancelled")
                case .success( _, _, _):
                    print("Facebook login succeeded")
                    self.getUserData {(respone) in
                        switch respone{
                        case .success(let result):
                            completion(.success(result))
                        case .failure(let err):
                            completion(.failure(err))
                        }
                    }
                }
            }
            
        }
    }
}
