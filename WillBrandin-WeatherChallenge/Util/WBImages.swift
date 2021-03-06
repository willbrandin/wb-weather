//
//  WBImages.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/25/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

struct WBImages {
    
    ///Images directly related to Weather.
    struct WeatherImage {
        static var thunderstormLarge: UIImage? {
            return UIImage(named: "thunderstorm")
        }
        
        static var cloudy: UIImage? {
            return UIImage(named: "cloudy")
        }
        
        static var drizzle: UIImage? {
            return UIImage(named: "drizzle")
        }
        
        static var rain: UIImage? {
            return UIImage(named: "rain")
        }
        
        static var sunny: UIImage? {
            return UIImage(named: "sunny")
        }
        
        ///Default center image. Will remain static.
        ///Look to make dynamic in future release.
        static var thunderstorm: UIImage? {
            return UIImage(named: "thunderstorm2")
        }
    }
    
    static var search: UIImage? {
        return UIImage(named: "search")
    }
}


