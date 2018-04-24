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
    var homeSearchView: HomeSearchView!
    
    private var forecastInstance: ForecastInstance? {
        didSet {
            DispatchQueue.main.async {
                self.homeSearchView.fiveDayForecastView.collectionView.reloadData()
            }
        }
    }
    private var shouldShowSearchResults: Bool = false
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchViewConstraints()
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
        
        homeSearchView.searchBar.textField.delegate = self
        homeSearchView.fiveDayForecastView.collectionView.delegate = self
    }

}

extension HomeViewController {
    
    
    func fetchData(){
        ForecastInstance.fetchDataWith(search: "Dallas") { (result) in
            
            switch result {
            case .success(let forecast):
                let thisForecast = forecast as ForecastInstance
                self.forecastInstance = thisForecast
            case .error(let err):
                print(err)
            }

        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let str = textField.text else { return false }
        if str.count == 0 {
            return false
        } else {
            let strResult = str.removeSpecialCharactersFromText()
            shouldShowSearchResults = true
            homeSearchView.setupTodayResultView()
            fetchData()
            textField.resignFirstResponder()
            return true
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let forecast = forecastInstance, let weather = forecast.list else {
            return 0
        }
        
        return weather.count - 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
        
    }
    
    
}

