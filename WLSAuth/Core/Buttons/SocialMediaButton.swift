//
//  SocialMediaButton.swift
//  WLSAuth
//
//  Created by Willa on 29/06/21.
//

import UIKit
import AuthenticationServices

class AppleLoginButton: ASAuthorizationAppleIDButton{
    
    override init(authorizationButtonType type: ASAuthorizationAppleIDButton.ButtonType, authorizationButtonStyle style: ASAuthorizationAppleIDButton.Style) {
        super.init(authorizationButtonType: type, authorizationButtonStyle: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}



class FacebookLoginButton: UIButton{
    
    
    var fontSize: CGFloat = 9{
        didSet{
            titleLabel?.font = .helveticaNeueBold(ofSize: fontSize)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setup() {
        
        setTitle("FACEBOOK", for: .normal)
        titleLabel?.font = .helveticaNeueBold(ofSize: fontSize)
        setLeftImageCenterText(image: #imageLiteral(resourceName: "facebookWhite"), imagePadding: 30, renderingMode: .automatic)
        setTitleColor(.white, for: .normal)
        backgroundColor = .facebookBlue
    }
}



class GoogleLoginButton: UIButton{
    
    var fontSize: CGFloat = 9{
        didSet{
            titleLabel?.font = .helveticaNeueBold(ofSize: fontSize)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setup() {
        titleLabel?.textAlignment = .center
        setTitle("GOOGLE", for: .normal)
        titleLabel?.font = .helveticaNeueBold(ofSize: fontSize)
        setLeftImageCenterText(image: #imageLiteral(resourceName: "googleWhite"), imagePadding: 20, renderingMode: .automatic)
        setTitleColor(.white, for: .normal)
        backgroundColor = .googleRed
    }
}
