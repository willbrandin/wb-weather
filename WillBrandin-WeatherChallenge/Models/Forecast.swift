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
    
    var list: [Forecast]?
}

///Represents a single Forecast.
///main contains all temperature data.
///weather is an array with one object in it. Default value used should be first.
///date is the date for day recognized. The date is represented every 3 hours. Therefore, I will show 3:00pm, 6:00pm, etc. for the forecast.
struct Forecast: Decodable{
    
    var temperature: Temperature?
    var weather: [Weather]?
    var date: String?
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temperature = "main"
        case date = "dt_txt"
    }
    
    ///Weather object contains the weather type aka "Cloudy" and a short description.
    struct Weather: Decodable {
        var weatherType: String?
        var weatherDescription: String?
        
        enum CodingKeys: String, CodingKey {
            case weatherType = "main"
            case weatherDescription = "description"
        }
    }
    
    ///Temperature object contains all data that refers to temperatures.
    struct Temperature: Decodable {
        
        var currentTemp: Double? //temp
        var tempHigh: Double? //temp_max
        var tempLow: Double? //temp_min
        
        enum CodingKeys: String, CodingKey {
            case currentTemp = "temp"
            case tempHigh = "temp_max"
            case tempLow = "temp_min"
        }
    }
    
}

//MARK: - Methods
extension Forecast {
    
    ///Takes in a search key and upon completion, returns a Result<T,U>
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
                
                ///Only sets the user defaults if the forecast is valid.
                ///What can happen is that an invalid string can be entered and no results found. However, an Instace is still created so it will not fail.
                ///I am checking forecast.list to make sure there are values and if so then I will save to UserDefaults
                ///Now if a user searches and they get an error, when they re-open the app, it will not present an error, just show the trip before.
                ///This will be a better user experience and not as confusing.
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

