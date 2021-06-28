//
//  AppleLoginService.swift
//  ios-gox
//
//  Created by Willa on 11/08/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit
import AuthenticationServices

class AppleLoginService: NSObject, SocialMediaLoginService , ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    override init() {
        super.init()
    }
    
    var type: SocialMediaType = .apple
    
    private var vc: UIViewController?
    private var completion: ((Result<SocialMediaLoginModel, Error>) -> Void)?
    
    func loginManager(viewController: UIViewController, completion: @escaping (Result<SocialMediaLoginModel, Error>) -> Void) {
        
        self.vc = viewController
        self.completion = completion
        
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    

    /// MARK:  ASAuthorizationControllerDelegate
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            var name = ""
            
            if let givenName = credentials.fullName?.givenName,
                let familyName = credentials.fullName?.familyName{
                name = givenName + " " + familyName
            }
            
            completion?(.success(SocialMediaLoginModel(
                email       : credentials.email ?? "",
                fullName    : name,
                uid         : credentials.user,
                provider    : "apple")
                ))
            
        default:
            completion?(.failure(WLSAuthError.other("Failed to login: invalid credentials")))
        }
        
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        completion?(.failure(error))
    }
    
    
    
    /// MARK:  ASAuthorizationControllerPresentationContextProviding
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor{
        
        if let window = self.vc?.view.window{
            return window
        }else{
            completion?(.failure(WLSAuthError.other("ERROR: Window is not found")))
            fatalError("ERROR: \(self.description) \(#function) Window is not found")
        }
        
    }
}
