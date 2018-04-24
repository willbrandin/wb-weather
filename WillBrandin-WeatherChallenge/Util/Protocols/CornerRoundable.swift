
//
//  CornerRoundable.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 4/12/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import Foundation
import UIKit


protocol CornerRoundable {
    func roundCorners()
}

extension CornerRoundable where Self: WBFloatingSearchBar {
    
    func roundCorners(){
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}




