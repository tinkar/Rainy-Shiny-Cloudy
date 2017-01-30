//
//  WeatherVC.swift
//  Rainy Shiny Cloudy
//
//  Created by Krystian Kopeć on 27.01.2017.
//  Copyright © 2017 Krystian Kopeć. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items : [String] = ["elo", "elo", "elo", "elo", "elo", "elo", "elo"]
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var tempLabel: UILabel!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var currentWeatherImage: UIImageView!
    
    @IBOutlet var currentWeatherType: UILabel!
    
    @IBOutlet var forecastTableView: UITableView!
    
    // create a generic instance of CurrentWeather class
    var currentWeather = CurrentWeather()
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return items.count
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
        
        print("ello")
        // performs the download function of class CurrentWeather
        currentWeather.downloadWeatherDetails {
            //Setup the ui
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

