//
//  CollectionViewExtensions.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

extension UITableView {
    ///When T conforms to ReusableView then I can use the default reuseId given. Aka the views class name.
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    ///Because I know that the cell confomrs to ReusableView I know it has a defaultReuseId property
    ///Using this I can declare a cell in a much cleaner way in CellForRow.
    func deqeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
}


extension UICollectionView {
    
    ///When T conforms to ReusableView then I can use the default reuseId given. Aka the views class name.
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    ///Because I know that the cell confomrs to ReusableView I know it has a defaultReuseId property
    ///Using this I can declare a cell in a much cleaner way in CellForRow.
    func deqeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView{
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
}
