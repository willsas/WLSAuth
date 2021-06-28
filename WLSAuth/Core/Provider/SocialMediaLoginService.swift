//
//  Provider.swift
//  WLSAuth
//
//  Created by Willa on 29/06/21.
//

import UIKit

protocol SocialMediaLoginService {
    
    /// Perform their native process to login social media
    /// - Parameters:
    ///   - viewController: current vc
    ///   - completion: completion called after getting a result from their native process and decode it to SocialMediaLoginModel
    func loginManager(viewController: UIViewController, completion: @escaping (Result<SocialMediaLoginModel, Error>) -> Void)
    
    
    /// Social Media type
    var type: SocialMediaType {get set}
}

enum SocialMediaType{
    ///Available
    case facebook
    ///Available
    case google
    ///Not Implemented yet
    case twitter
    /// Apple login
    case apple
}
