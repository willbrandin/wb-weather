//
//  CellReusable.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol CellLoadableView: class {
    static var cellName: String { get }
}

extension CellLoadableView where Self: UIView {
    static var cellName: String {
        return String(describing: self)
    }
}
