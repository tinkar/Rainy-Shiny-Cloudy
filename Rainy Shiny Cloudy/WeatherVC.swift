//
//  WeatherVC.swift
//  Rainy Shiny Cloudy
//
//  Created by Krystian Kopeć on 27.01.2017.
//  Copyright © 2017 Krystian Kopeć. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var tempLabel: UILabel!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var currentWeatherImage: UIImageView!
    
    @IBOutlet var currentWeatherType: UILabel!
    
    @IBOutlet var forecastTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

