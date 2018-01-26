//
//  Constants.swift
//  Weathered
//
//  Created by Eugene Baung on 12/25/17.
//  Copyright © 2017 Baung. All rights reserved.
//

import Foundation

// completion handler (for asynchronous data sources - don't know when the requested data will be returned from the source)
typealias DownloadComplete = () -> ()       // () -> () is a "simplified closure"

let API_HOMEPAGE = "http://openweathermap.org/"
let NOTIF_DOWNLOAD_COMPLETE = NSNotification.Name("dataDownloaded")

let API_KEY = "&appid=d0f441b3b6bc6f5ae46c703ad2d45303"
let API_UNITS = "&units=metric"
let LONG = Location.instance.longitude //106.67583063
let LAT = Location.instance.latitude //10.76833026 

let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=\(LAT)&lon=\(LONG)\(API_UNITS)\(API_KEY)"


//let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(LAT)&lon=\(LONG)&cnt=5\(API_UNITS)\(API_KEY)"
// free OpenWeatherMap API does not include 16 day forecast

let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast?lat=\(LAT)&lon=\(LONG)\(API_UNITS)\(API_KEY)" // this is the 5 day/3 hour Free OpenWeatherMap API

