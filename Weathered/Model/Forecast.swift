//
//  Forecast.swift
//  Weathered
//
//  Created by Eugene Baung on 1/6/18.
//  Copyright © 2018 Baung. All rights reserved.
//

import Foundation
import SwiftyJSON

class Forecast {
    fileprivate var _date: String!
    fileprivate var _time: String!
    fileprivate var _weatherType: String!
    fileprivate var _highTemp: Int!
    fileprivate var _lowTemp: Int!
    
    var date: String {
        get {
            return _date
        } set {
            _date = newValue
        }
    }
    
    var time: String {
        get {
            return _time
        } set {
            _time = newValue
        }
    }
    
    var weatherType: String {
        get {
            return _weatherType
        } set {
            _weatherType = newValue
        }
    }
    
    var highTemp:Int {
        get {
            return _highTemp
        } set {
            _highTemp = newValue
        }
    }
    
    var lowTemp: Int {
        get {
            return _lowTemp
        } set {
            _lowTemp = newValue
        }
    }
    
    class func loadForecastFromData (_ APIData: Data) -> [Forecast]{
        var forecast = [Forecast]()
        do {
        let json = try JSON(data: APIData)
        
        if let list = json["list"].array {
            // 5 day/3 hour forecast recursion below:
            for day in list {
                let dayForecast = Forecast()
                dayForecast.time = day["dt_txt"].stringValue
                dayForecast.highTemp = day["main"]["temp_max"].intValue
                dayForecast.lowTemp = day["main"]["temp_min"].intValue
                dayForecast.weatherType = day["weather"][0]["main"].stringValue
                
                let date = day["dt"].doubleValue
                let unixConvertedDate = Date(timeIntervalSince1970: date)
                dayForecast.date = unixConvertedDate.dayOfTheWeek()
                //print(dayForecast.date)
                forecast.append(dayForecast)
            }
            
            // Original, 16 day forecast recursion below
//            for day in list {
//                let dayForecast = Forecast()
//                dayForecast.highTemp = day["temp"]["max"].intValue
//                dayForecast.lowTemp = day["temp"]["min"].intValue
//                dayForecast.weatherType = day["weather"][0]["main"].stringValue
//
//                let date = day["dt"].doubleValue
//                let unixConvertedDate = Date(timeIntervalSince1970: date)
//                dayForecast.date = unixConvertedDate.dayOfTheWeek()
//                //print(dayForecast.date)
//                forecast.append(dayForecast)
//                }
            }
        } catch let error as NSError {
            print(error)
        }
        
        return forecast
    }
}
