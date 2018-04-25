//
//  HomeSearchView.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class HomeSearchView: UIView {
    
    //MARK: - Properties
    
    private var weatherInstance: ForecastInstance?
    
    //MARK: - UI Elements
    var searchBar: WBFloatingSearchBar!
    var todaysResultView: TodaysResultView!
    var fiveDayForecastView: FiveDayForecastView!
    
    //MARK: - Init
    
    func customizeUI(){
        self.backgroundColor = WBColors.darkBlue
        setupSearchBarConstraints()
        setupTodayResultView()
        setupFiveDayForecastView()
    }
    
    //MARK: - Methods
    private func setupSearchBarConstraints(){
        searchBar = WBFloatingSearchBar()
        searchBar.initSearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25.0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    }
    
    func setupTodayResultView(){
        todaysResultView = TodaysResultView()
        todaysResultView.initUI()
        todaysResultView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(todaysResultView)
        
        todaysResultView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 65.0).isActive = true
        todaysResultView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        todaysResultView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        todaysResultView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    private func setupFiveDayForecastView(){
        fiveDayForecastView = FiveDayForecastView()
        fiveDayForecastView.initUI()
        fiveDayForecastView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fiveDayForecastView)
        
        fiveDayForecastView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -35.0).isActive = true
        fiveDayForecastView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        fiveDayForecastView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        fiveDayForecastView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        
    }
    
}
