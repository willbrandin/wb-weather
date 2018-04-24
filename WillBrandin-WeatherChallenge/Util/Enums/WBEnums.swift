//
//  WBEnums.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import Foundation

public enum Result<T,U> {
    case success(T)
    case error(U)
}
