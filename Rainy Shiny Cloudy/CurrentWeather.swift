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
            // grab the contents of the response
            let result = response.result
            
            // cast it to dictionary
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                // find the name of the city
                if let name = dict["name"] as? String {
                    
                    // update the variable with the name of the city
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                // grab weather array of dictionaries inside the json
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    //grab weather data from the first array index of weather dictionary, the key of main and cast it as a string
                    if let main = weather[0]["main"] as? String {
                        
                        // update the data in the class
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let convertedTemp = currentTemperature - 272.150
                        
                        let roundedConvertedTemp = Double(round(10 * convertedTemp/10))
                            
                        self._currentTemp = roundedConvertedTemp
                        print(self._currentTemp)
                    }
                    
                }

            }
            
        }
        
        // tells the app that the function has completed
        completed()
        
    }

}
