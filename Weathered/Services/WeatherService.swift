//
//  WeatherService.swift
//  Weathered
//
//  Created by Eugene Baung on 12/25/17.
//  Copyright © 2017 Baung. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService{
    static let instance = WeatherService()
    fileprivate var _currentWeather = CurrentWeather()
    fileprivate var _forecast = [Forecast]()
    
    var currentWeather: CurrentWeather{
        get{
            return _currentWeather
        } set {
            _currentWeather = newValue
        }
    }
    
    var forecast: [Forecast]{
        get {
            return _forecast
        } set {
            _forecast = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseData { (response) in
            
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            completed()
            
            
            //test printout block [Command + Alt + Left/Right Arrow to fold/expand]
//            print(self.currentWeather.cityName)
//            print(self.currentWeather.weatherType)
//            print(self.currentWeather.date)
//            print(self.currentWeather.currentTemp)
            
            
            //print(response.result.value ?? "")
        }
    }
    
    func  downloadForecast(completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_FORECAST)
        Alamofire.request(url!).responseData { (response) in
            self.forecast = Forecast.loadForecastFromData(response.data!)
            if self.forecast.count>0{                   // remove current day from forecast
                self.forecast.remove(at: 0)
            }
            completed()
        }
    }
}
