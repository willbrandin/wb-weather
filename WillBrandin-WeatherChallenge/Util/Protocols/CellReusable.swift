//
//  CellReusable.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

protocol ReusableView {}

///ReusableView allows me to add a defaultReuseId for any UIView that uses this.
///Reuse Id is not always going to be the name of cell class.
///ie. HomeCollectionCell.defaultReuseIdentifier = "HomeCollectionCell"
///Used to dequeue generic cells. Refer to CollectionViewExtensions
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
