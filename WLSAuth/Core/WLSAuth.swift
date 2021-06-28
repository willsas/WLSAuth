//
//  WLSAuth.swift
//  WLSAuth
//
//  Created by Willa on 29/06/21.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn

public enum Provider{
    ///Available
    case facebook
    ///Available
    case google(clientId: String)
    ///Not Implemented yet
    case twitter
    /// Apple login
    case apple
}

class WLSAuth {
    
    static func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
                            providers: [Provider]) {
        providers.forEach { provider in
            switch provider {
            case .google(let clientId):
                GIDSignIn.sharedInstance().clientID = clientId
            case .facebook:
                ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
            default:
                break
            }
        }
    }
    
    
    static func application(_ app: UIApplication,
                            open url: URL,
                            options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation]) // Facbook login

        GIDSignIn.sharedInstance().handle(url) // Google login
        
        return true
    }
}
