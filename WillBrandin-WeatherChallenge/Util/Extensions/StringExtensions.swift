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
        
        let notAllowedChars: CharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,").inverted
        return self.components(separatedBy: notAllowedChars).joined(separator: "")
    }
    
    func stringToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = WBDateFormat.weekDayAndTime.rawValue
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        let date = dateFormatter.date(from: self)!
        return date
    }
    
    func stringWithDateFormat(_ format: WBDateFormat) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue // Your New Date format as per requirement change it own
        let date = self.stringToDate()
        
        return dateFormatter.string(from: date)
        
    }

}







