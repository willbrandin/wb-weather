//
//  ColorExtensions.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit



extension UIColor {
    
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.7
    }
    
    
    convenience init(hex: String) {
        let filtered = hex.removeSpecialCharactersFromText()
        let scanner = Scanner(string: filtered)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
}
