//
//  IntExtensions.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import Foundation

extension Double {
    
    ///Takes temperature in Kelvin and converts to Fahrenheit
    func temperatureInFahrenheit() -> Int {
        let fahrenheitTemperature = (9 / 5) * (self - 273) + 32
        return Int(fahrenheitTemperature)
    }
}
