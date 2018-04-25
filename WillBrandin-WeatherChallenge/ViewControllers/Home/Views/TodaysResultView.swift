//
//  TodaysResultView.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class TodaysResultView: UIView {
    
    
    //MARK: - UI Elements
    
    lazy var temperatureTitle: UILabel! = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 55.0)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var weatherImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var weatherDescription: UILabel! = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
        label.textColor = WBColors.lightText
        return label
    }()
    
    lazy var todaysWeatherStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(temperatureTitle)
        stackView.addArrangedSubview(weatherImg)
        stackView.addArrangedSubview(weatherDescription)
        stackView.spacing = 5.0
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    //MARK: - Init
    func initUI(){
        setupStackViewConstraints()
    }
    
    //MARK: - Methods
    
    func reloadData(_ forecast: ForecastInstance.ForecastObject?) {
        
        guard let tempText = forecast?.main?.currentTemp else { return }
        
        temperatureTitle.text = "\(tempText.temperatureInFahrenheit())°"
        weatherImg.image = WBImages.WeatherImage.thunderstormLarge
        weatherDescription.text = forecast?.weather?.first?.weatherDescription?.capitalized
    }
    
    private func setupStackViewConstraints(){
        addSubview(todaysWeatherStackView)
        todaysWeatherStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        todaysWeatherStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        todaysWeatherStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        todaysWeatherStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        temperatureTitle.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        weatherImg.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
    }
}
