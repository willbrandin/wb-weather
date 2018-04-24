//
//  StringExtensions.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import Foundation

extension String {
   
    func removeSpecialCharactersFromText() -> String {
        
        let notAllowedChars: CharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ").inverted
        return self.components(separatedBy: notAllowedChars).joined(separator: "")
    }

}
