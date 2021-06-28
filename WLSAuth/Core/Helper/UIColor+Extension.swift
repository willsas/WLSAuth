//
//  UIColor+Extension.swift
//  ios-gox
//
//  Created by Willa on 07/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIColor{
    
    
    /// 5C79FF
    static var facebookBlue = #colorLiteral(red: 0.3607843137, green: 0.4745098039, blue: 1, alpha: 1)
    
    /// DB4437
    static var googleRed = #colorLiteral(red: 0.8588235294, green: 0.2666666667, blue: 0.2156862745, alpha: 1)
    
    
    /// Set a color with hex code
    /// - Parameters:
    ///   - hex: hex code
    ///   - alpha: alpha
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


