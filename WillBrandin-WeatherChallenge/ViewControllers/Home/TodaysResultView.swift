//
//  TodaysResultView.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class TodaysResultView: UIView {
    
    //MARK: - Properties
    
    //MARK: - UI Elements
    
    lazy var temperature: UILabel! = {
        let label = UILabel()
        label.text = "16"
        label.font = UIFont.systemFont(ofSize: 32.0)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var weatherImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunny")
        return imageView
    }()
    
    lazy var weatherDescription: UILabel! = {
        let label = UILabel()
        return label
    }()
    
    
    
    //MARK: - Methods
    func initUI(){
        self.backgroundColor = UIColor.green
    }
    
    func setupStackViewConstraints(){
        
    }
}
