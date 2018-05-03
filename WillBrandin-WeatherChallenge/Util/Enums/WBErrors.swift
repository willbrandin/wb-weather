//
//  WBErrors.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/25/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

enum WBError: Error {
    
    ///Error for when the user passes in no text to the search bar or for some reason fetch is called with nil text.
    case searchTextNil
    ///Error for when decoder fails. This would be due to a network failure or parsing failure.
    case jsonNotFormatted
    ///Error returned when the text entered does not return any values from the API.
    ///ie. ForecastInstance.list = nil
    case badSearchFormat
    
    ///Initializes a UIAlertController for self.
    ///Adds a default "Okay" action.
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
            let alert = UIAlertController.defaultAlert("No Results", "Sorry, but that format isn't working. Try searching something else.")
            alert.addDefaultAction()
            return alert
        
        }
        
    }
}
