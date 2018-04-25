
//
//  CornerRoundable.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 4/12/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import Foundation
import UIKit

///Allows UI Elements to have default implementation of CornerRoundable.

protocol CornerRoundable {
    func roundCorners()
}
///If had another object that needed similar implementation of round corners, I could add another extension or use "Self: UIView" and provide default functionality.
extension CornerRoundable where Self: WBFloatingSearchBar {
    
    func roundCorners(){
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}




