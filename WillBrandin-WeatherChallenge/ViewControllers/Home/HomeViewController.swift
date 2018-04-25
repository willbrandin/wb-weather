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
    private var shouldShowPreviousResults: Bool = false

    private var forecastInstance: ForecastInstance? {
        didSet {
            DispatchQueue.main.async {
                self.homeSearchView.fiveDayForecastView.collectionView.reloadData()
                self.homeSearchView.todaysResultView.reloadData(self.forecastInstance?.list?.first)
            }
        }
    }

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchViewConstraints()
        
        if shouldShowPreviousResults {
            fetchFromDefaults()
        }
    }
    
    //MARK: - Init
    init(_ withSearch: Bool) {
        self.shouldShowPreviousResults = withSearch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupSearchViewConstraints(){
        
        //Initialize View
        homeSearchView = HomeSearchView()
        homeSearchView.customizeUI()
        self.view.addSubview(homeSearchView)
        
        //Set view constraints
        homeSearchView.translatesAutoresizingMaskIntoConstraints = false
        homeSearchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        homeSearchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        homeSearchView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        homeSearchView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        setDelegates()
    }
    
    private func setDelegates(){
        
        homeSearchView.searchBar.textField.delegate = self
        homeSearchView.fiveDayForecastView.collectionView.delegate = self
        homeSearchView.fiveDayForecastView.collectionView.dataSource = self
        
        homeSearchView.fiveDayForecastView.collectionView.register(WeatherCollectionViewCell.self)
    }
}

//MARK: - Fetch Data
extension HomeViewController {
    
    
    func fetchData(_ searchValue: String){
        ForecastInstance.fetchDataWith(search: searchValue) { (result) in
            
            switch result {
            case .success(let forecast):
                let thisForecast = forecast as ForecastInstance
                if let _ = thisForecast.list {
                    self.forecastInstance = thisForecast
                } else {
                    print("ERROR: Can't read state")
                }
            case .error(let error):
                print(error)
            }

        }
    }
    
    private func fetchFromDefaults(){
        let defaults = UserDefaults.standard
        guard let search = defaults.string(forKey: WBUserDefaultKeys.searchKey.rawValue) else { return }
        fetchData(search)
    }
}

//MARK: - Delegates

extension HomeViewController: UITextFieldDelegate {
    //Search will only be performed when the user enters in more than 0 characters.
    //TODO: - When 0 characters. indicate to user that it cannot perform search. Pop up or inline error?
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let str = textField.text else { return false }
        if str.count == 0 {
            return false
        } else {
            let strResult = str.removeSpecialCharactersFromText()
            fetchData(strResult)
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
        
        let cell: WeatherCollectionViewCell = collectionView.deqeueReusableCell(for: indexPath)
        cell.configureCell(forecastInstance?.list![indexPath.row + 1])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.18, height: 120)
    }
}

