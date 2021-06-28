//
//  UIButton+Extension.swift
//  ios-gox
//
//  Created by Willa on 03/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit


extension UIButton{

    
    /// Set frame size to height 40 and  and width superview frame width
    public func setLoginButtonSize(){
        self.frame.size = CGSize(width: superview?.frame.width ?? UIScreen.main.bounds.width, height: 40)
    }
    
    
//    /// <#Description#>
//    /// - Parameter show: <#show description#>
//    func loadingIndicator(_ show: Bool) {
//        let tag = 808404
//        if show {
//            self.isEnabled = false
//            self.alpha = 0.5
//            let indicator = UIActivityIndicatorView()
//            let buttonHeight = self.bounds.size.height
//            let buttonWidth = self.bounds.size.width
//            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
//            indicator.tag = tag
//            self.addSubview(indicator)
//            indicator.startAnimating()
//        } else {
//            self.isEnabled = true
//            self.alpha = 1.0
//            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
//                indicator.stopAnimating()
//                indicator.removeFromSuperview()
//            }
//        }
//    }
    
    
    /// Add a left image
    /// - Parameters:
    ///   - image: UIImage
    ///   - renderMode: image rendering mode
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: image.size.width / 2)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    
    
    /// Add a right image
    /// - Parameters:
    ///   - image: UIImage
    ///   - renderMode: image rendering mode
    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        setImage(image.withRenderingMode(renderMode), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 0)
        semanticContentAttribute = UIApplication.shared
        .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
    }
    
    
    
    /// Add a left image but the button text is centered
    /// - Parameters:
    ///   - image:UIimage
    ///   - imagePadding: set the image padding
    ///   - renderingMode: image rendering mode
    func setLeftImageCenterText(image : UIImage, imagePadding: CGFloat, renderingMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderingMode), for: .normal)
        guard let imageViewWidth = self.imageView?.frame.width else{return}
        self.contentHorizontalAlignment = .center
        let imageLeft = imagePadding - imageViewWidth / 2
        imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageLeft, bottom: 0.0, right: 0.0)
    }
    
    
    /// Change image tint color
    /// - Parameter color: UIcolor
    func setImageTintColor(_ color: UIColor) {
          let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
          self.setImage(tintedImage, for: .normal)
          self.tintColor = color
      }
}


