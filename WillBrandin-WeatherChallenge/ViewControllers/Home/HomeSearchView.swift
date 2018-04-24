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
    
    //MARK: - UI Elements
    var searchBar: WBFloatingSearchBar!
    
    //MARK: - Init
    
    func customizeUI(){
        
        self.backgroundColor = WBColors.darkBlue
        setupSearchBarConstraints()
    }
    
    //MARK: - Methods
    func setupSearchBarConstraints(){
        searchBar = WBFloatingSearchBar()
        searchBar.initSearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25.0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    }
    
}
