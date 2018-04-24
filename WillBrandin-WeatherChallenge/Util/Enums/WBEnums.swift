//
//  WBEnums.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

public enum Result<T,U> {
    case success(T)
    case error(U)
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
            return UIImage(named: "cloudy")
        case .drizzle:
            return UIImage(named: "drizzle")
        case .rain, .atmosphere, .snow:
            return UIImage(named: "rain")
        case .sunny, .clear:
            return UIImage(named: "sunny")
        case .thunderstorm, .extreme, .additional:
            return UIImage(named: "thunderstorm2")
        
        }
    }
}
