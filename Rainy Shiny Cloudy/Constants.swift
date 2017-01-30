//
//  Constants.swift
//  Rainy Shiny Cloudy
//
//  Created by Krystian Kopeć on 27.01.2017.
//  Copyright © 2017 Krystian Kopeć. All rights reserved.
//

import UIKit


let base_Url = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat=37.33"
let longitude = "&lon=-122.03"
let appID = "&appid="
let apiKey = "389a5df58a1b98240c880691e86a3e16"

// tell our function that the download is complete
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = base_Url + latitude + longitude + appID + apiKey



