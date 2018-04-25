//
//  Forecast.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import Foundation

///Forecase Instance.
///Forecast instance contains the list of Forecasts for the city.
///ie. a 7 day forecast for a ForecastInstance will "live" in the "list" also [ForecastObject].
///ForecastObject contains the data specific to a forecast like temp, weather, etc.
struct ForecastInstance: Decodable {
    
    var list: [ForecastObject]?
     
    
}

struct ForecastObject: Decodable{
    var main: Forecast?
    var weather: [Weather]?
    var date: String?
    
    enum CodingKeys: String, CodingKey {
        case main, weather
        case date = "dt_txt"
    }
    
    struct Weather: Decodable {
        var weatherType: String?
        var weatherDescription: String?
        
        
        enum CodingKeys: String, CodingKey {
            case weatherType = "main"
            case weatherDescription = "description"
        }
    }
    
    struct Forecast: Decodable {
        
        var currentTemp: Double? //temp
        var tempHigh: Double? //temp_max
        var tempLow: Double? //temp_min
        
        
        enum CodingKeys: String, CodingKey {
            case currentTemp = "temp"
            case tempHigh = "temp_max"
            case tempLow = "temp_min"
        }
    }
    
    //MARK: - Methods
    
    static func fetchDataWith(search: String?, completion: @escaping (Result<ForecastInstance, WBError?>) -> Void) {
        
        let defaults = UserDefaults.standard
        guard var searchedText = search else {
            completion(.error(.searchTextNil))
            return
        }
        
        ///Hacking it
        ///In the event that someone puts a "," I am assuming the user is entering a state.
        ///In this case, OpenWeather will not except the query. So I am adding ",USA" to the string in order to satisfy the requirements for OpenWeather
        if searchedText.contains(",") {
            searchedText.append(",USA")
        }
        
        let jsonURLString = "http://api.openweathermap.org/data/2.5/forecast?q=\(searchedText)&cnt=6&APPID=3ca14619ab6b9603a054088537948f2b"
        
        guard let url = URL(string: jsonURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let forecast = try JSONDecoder().decode(ForecastInstance.self, from: data)
                
                if let _ = forecast.list {
                    defaults.setValue(searchedText, forKey: WBUserDefaultKeys.searchKey.rawValue)
                    defaults.set(true, forKey: WBUserDefaultKeys.didSearch.rawValue)
                    
                    completion(.success(forecast))
                } else {
                    completion(.error(.badSearchFormat))
                }
            } catch {
                completion(.error(.jsonNotFormatted))
            }
            
            }.resume()
        
    }
}

