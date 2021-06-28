//
//  GoogleLoginService.swift
//  ios-gox
//
//  Created by Willa on 26/05/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleLoginService: NSObject, SocialMediaLoginService, GIDSignInDelegate {
    

    private var loginCompletion: (Result<SocialMediaLoginModel, Error>) -> Void = {_ in}
    var type: SocialMediaType = .google
    
    override init() {
        super.init()
        GIDSignIn.sharedInstance().delegate = self
    }
        
    
    func loginManager(viewController: UIViewController, completion: @escaping (Result<SocialMediaLoginModel, Error>) -> Void) {
        GIDSignIn.sharedInstance()?.presentingViewController = viewController
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        GIDSignIn.sharedInstance()?.signOut()
        GIDSignIn.sharedInstance()?.signIn()
        loginCompletion = completion
    }
    
    
    // MARK: GIDSignInDelegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                loginCompletion(.failure(WLSAuthError.other("The user has not signed in before or they have since signed out.")))
            }else{
                loginCompletion(.failure(WLSAuthError.other("Login cancelled")))
                print("ERROR: \(self.description) Login error: \(error.localizedDescription)")
            }
            return
        }
        
        guard let email = user.profile.email,
            let fullName = user.profile.name,
            let uid = user.userID,
            let token = user.authentication.idToken else {
                loginCompletion(.failure(WLSAuthError.other("ERROR: uid user are empty!")))
                return
        }
        
        loginCompletion(.success(SocialMediaLoginModel(email: email, fullName: fullName, uid: uid, provider: "google", accessToken: token)))
        return
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        loginCompletion(.failure(error))
        print("ERROR: \(self.description) Login error: \(error.localizedDescription)")
        return
    }
    

}
