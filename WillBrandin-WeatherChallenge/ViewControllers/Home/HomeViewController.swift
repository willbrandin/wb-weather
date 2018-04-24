//
//  ViewController.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    private var homeSearchView: HomeSearchView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = WBColors.darkBlue
    }

    //MARK: - Methods
    
    func setupSearchViewConstraints(){
        homeSearchView = HomeSearchView()
        homeSearchView.customizeUI()
        self.view.addSubview(homeSearchView)
        
        homeSearchView.translatesAutoresizingMaskIntoConstraints = false
        homeSearchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        homeSearchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        homeSearchView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        homeSearchView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}

