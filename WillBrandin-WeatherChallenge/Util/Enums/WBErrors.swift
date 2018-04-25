//
//  WBErrors.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/25/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

enum WBError: Error {
    
    case searchTextNil
    case jsonNotFormatted
    case badSearchFormat
    
    func initAlert() -> UIAlertController {
        
        switch self {
        
        case .searchTextNil:
            let alert = UIAlertController.defaultAlert("No Search Text", "You need to enter something to get your weather!")
            alert.addDefaultAction()
            return alert
            
        case .jsonNotFormatted:
            let alert = UIAlertController.defaultAlert("Formatting Error", "Okay, this one's on us. This isn't right")
            alert.addDefaultAction()
            return alert
            
        case .badSearchFormat:
            let alert = UIAlertController.defaultAlert("That won't work", "Sorry, but that format isn't working. Try searching something else.")
            alert.addDefaultAction()
            return alert
            
        default:
            let alert = UIAlertController.defaultAlert("Hmm", "Something isn't right. Try again later.")
            alert.addDefaultAction()
            return alert
        }
        
    }
}
