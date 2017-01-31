//
//  Forecast.swift
//  Rainy Shiny Cloudy
//
//  Created by Krystian Kopeć on 31.01.2017.
//  Copyright © 2017 Krystian Kopeć. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    // DATA ENCAPSULATION
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                
                let convertedTemp = convertKelvinToCelsius(temp: min)
                self._lowTemp = String(convertedTemp)
                
            }
            if let max = temp["max"] as? Double {
                
                let convertedTemp = convertKelvinToCelsius(temp: max)
                self._lowTemp = String(convertedTemp)
            }
       
        }
        if let weather = weatherDict["weather"] as! [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as String {
                
                self._weatherType = main
            }
        }
    }
    
    func convertKelvinToCelsius (temp: Double) -> (Double) {
        
        
            
        let convertedTemp = temp - 272.150
        
        let roundedConvertedTemp = Double(round(10 * convertedTemp/10))
        
        return roundedConvertedTemp

    }
    
}
// get the day of the week from the date
extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    
    }
    
}
