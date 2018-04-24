//
//  Shadowable.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit


protocol Shadowable {
    func makeShadow()
}

extension Shadowable where Self: WBFloatingSearchBar {
    
    func makeShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.4
        
    }
}
