//
//  HomeSearchView.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class HomeSearchView: UIView {
    
    
    //MARK: - UI Elements
    var searchBar: WBFloatingSearchBar!
    var todaysResultView: TodaysResultView!
    var upcomingForecastView: FiveDayForecastView!
    
    //MARK: - Init
    override func layoutSubviews() {
        setupGradientBackground()
    }
    
    ///Used to initialize the UI
    func customizeUI(){
        setupSearchBar()
        setupTodayResultView()
        setupUpcomingForecastView()
    }
    
    //MARK: - Methods
    private func setupSearchBar(){
        searchBar = WBFloatingSearchBar()
        searchBar.initSearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25.0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
    }
    
    private func setupTodayResultView(){
        todaysResultView = TodaysResultView()
        todaysResultView.initUI()
        todaysResultView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(todaysResultView)
        
        todaysResultView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 45.0).isActive = true
        todaysResultView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        todaysResultView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        todaysResultView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        
    }
    
    private func setupUpcomingForecastView(){
        upcomingForecastView = FiveDayForecastView()
        upcomingForecastView.initUI()
        upcomingForecastView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(upcomingForecastView)
        
        upcomingForecastView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
        upcomingForecastView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0).isActive = true
        upcomingForecastView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0).isActive = true
        upcomingForecastView.heightAnchor.constraint(equalToConstant: 130.0).isActive = true
        
    }
    
    private func setupGradientBackground(){
        let startingColor = WBColors.brightBlue.cgColor
        let endingColor = WBColors.darkBlue.cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.frame = self.frame
        gradient.colors = [startingColor, endingColor]
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
}
