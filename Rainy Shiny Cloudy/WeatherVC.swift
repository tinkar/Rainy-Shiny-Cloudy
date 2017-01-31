//
//  WeatherVC.swift
//  Rainy Shiny Cloudy
//
//  Created by Krystian Kopeć on 27.01.2017.
//  Copyright © 2017 Krystian Kopeć. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var tempLabel: UILabel!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var currentWeatherImage: UIImageView!
    
    @IBOutlet var currentWeatherType: UILabel!
    
    @IBOutlet var forecastTableView: UITableView!
    
    // create a generic instance of CurrentWeather and Forecast classes
    var currentWeather = CurrentWeather()
    var forecast = Forecast()
    var forecasts = [Forecast]()

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        
        currentWeather = CurrentWeather()
        forecast = Forecast()
        

        
        print(FORECAST_URL)
        // performs the download function of class CurrentWeather
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
        }
        
    }

    
    func downloadForecastData () {
        // downloading forecast data for the table view
        
        let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(forecastURL!).responseJSON { response in
            
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? Dictionary<String, AnyObject> {
                    
                    for obj in list {
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                    }
                }
            }
                
        }
        
    }
    func updateMainUI() {
        dateLabel.text = currentWeather._date
        tempLabel.text = String(currentWeather._currentTemp)
        currentWeatherType.text = currentWeather._weatherType
        locationLabel.text = currentWeather._cityName
        // use image with the name of the weather type downloaded in json:
        currentWeatherImage.image = UIImage(named: currentWeather._weatherType)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

