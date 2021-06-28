//
//  TwitterService.swift
//  ios-gox
//
//  Created by Willa on 26/05/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

struct TwitterLoginService: SocialMediaLoginService {
    
    func loginManager(viewController: UIViewController, completion: @escaping (Result<SocialMediaLoginModel, Error>) -> Void) {
        print("TWITTER LOGIN SERVICE")
    }
    
    var type: SocialMediaType = .twitter
}
