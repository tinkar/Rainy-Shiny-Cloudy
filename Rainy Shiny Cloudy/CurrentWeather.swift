//
//  CurrentWeather.swift
//  Rainy Shiny Cloudy
//
//  Created by Krystian Kopeć on 27.01.2017.
//  Copyright © 2017 Krystian Kopeć. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!

    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date : String {
        if _date == nil {
            _date = ""
        }
    
        // format the date and time
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        // take the current
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
   
    func downloadWeatherDetails(completed: DownloadComplete) {
        
        // Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        // closure means that after we request it, we want to give it a response
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            print(result)
        }
        
        
    }
    
    
    
    
}
