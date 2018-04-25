//
//  WBEnums.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

///Result used for callbacks.
///For closure it allows to switch on result providing the object from success or the type of Error.
public enum Result<T,U> {
    case success(T)
    case error(U)
}

enum WBUserDefaultKeys: String {
    case searchKey = "searchPhrase"
    case didSearch = "didSearch"
}

enum CollectionViewImageType: String {
    case cloudy = "Clouds"
    case drizzle = "Drizzle"
    case rain = "Rain"
    case thunderstorm = "Thunderstorm"
    case sunny = "Sunny"
    case snow = "Snow"
    case atmosphere = "Atmosphere"
    case clear = "Clear"
    case extreme = "Extreme"
    case additional = "Additional"
    
    func returnImgForWeatherType() -> UIImage? {
        switch self {
        case .cloudy:
            return WBImages.WeatherImage.cloudy
        case .drizzle:
            return WBImages.WeatherImage.drizzle
        case .rain, .atmosphere, .snow:
            return WBImages.WeatherImage.rain
        case .sunny, .clear:
            return WBImages.WeatherImage.sunny
        case .thunderstorm, .extreme, .additional:
            return WBImages.WeatherImage.thunderstorm
        
        }
    }
}

enum WBDateFormat: String {
    case simpleDate = "MM/dd/yyyy"
    case dateAndTime = "MMMM d, h:mm a"
    case weekDayAndTime = "yyyy-MM-dd HH:mm:ss"
    case serverDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case weekday = "E"
    case simpleMonthDate = "MM/dd"
}




