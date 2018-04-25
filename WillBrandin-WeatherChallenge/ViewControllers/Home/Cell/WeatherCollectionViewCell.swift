//
//  WeatherCollectionViewCell.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell, ReusableView {
    
    //MARK: - Properties
    private var weatherObj: ForecastObject?
    
    //MARK: - UI Elements
    lazy var weekDay: UILabel! = {
        let label = UILabel()
        label.text = weatherObj?.date?.stringWithDateFormat(.weekday)
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    ///Time Label added due to API constraints.
    ///API returned a date however it was every 3 hours for each day.
    ///In a normal situation I would talk to API owners to see if I could just have each single day.
    ///As a fix I added the time as a seperate label. This gives the user context as to what time they can expect certain weather elements
    lazy var timeLbl: UILabel! = {
        let label = UILabel()
        label.text = weatherObj?.date?.stringWithDateFormat(.justTime)
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    lazy var weatherImg: UIImageView = {
        let imageView = UIImageView()
        let type = CollectionViewImageType(rawValue: (weatherObj?.weather![0].weatherType)!)
        imageView.image = type?.returnImgForWeatherType()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var highAndLow: UILabel! = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        guard let high = weatherObj?.main?.tempHigh?.temperatureInFahrenheit() else { return label}
        guard let low = weatherObj?.main?.tempLow?.temperatureInFahrenheit() else { return label }
        label.text = "\(high)/\(low)"
        return label
    }()
    
    lazy var forecastStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(weekDay)
        stackView.addArrangedSubview(timeLbl)
        stackView.addArrangedSubview(weatherImg)
        stackView.addArrangedSubview(highAndLow)
        stackView.spacing = 3.0
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func configureCell(_ weather: ForecastObject?){
        self.weatherObj = weather
        setupStackViewConstraints()
    }
    
    //MARK: - Methods
    func setupStackViewConstraints(){
        addSubview(forecastStackView)
        forecastStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        forecastStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        forecastStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        forecastStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        weatherImg.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        weatherImg.centerYAnchor.constraint(equalTo: forecastStackView.centerYAnchor).isActive = true
    }
}
