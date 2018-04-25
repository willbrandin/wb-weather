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

///Value from API will init one of the cases
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
    
    ///Using the enum case I can switch on self to return an image for the collection view image.
    ///I do not have all the assets needed to cover additional cases so I will return an image that is close to the weather type.
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
///Date format strings used for this and other projects
enum WBDateFormat: String {
    case simpleDate = "MM/dd/yyyy"
    case dateAndTime = "MMMM d, h:mm a"
    case weekDayAndTime = "yyyy-MM-dd HH:mm:ss"
    case serverDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case weekday = "E"
    case simpleMonthDate = "MM/dd"
    case justTime = "h:mm a"
}




