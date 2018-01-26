//
//  CurrentWeather.swift
//  Weathered
//
//  Created by Eugene Baung on 1/2/18.
//  Copyright © 2018 Baung. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWeather{
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Int!
    
    var cityName: String {
        get {
            return _cityName
        } set {
            _cityName = newValue
        }
    }
    var date: String {
        get {
            return _date
        } set {
            _date = newValue
        }
    }
    var weatherType: String {
        get {
            return _weatherType
        } set {
            _weatherType = newValue
        }
    }
    var currentTemp: Int {
        get {
            return _currentTemp
        } set {
            _currentTemp = newValue
        }
    }
    class func loadCurrentWeatherFromData(_ APIData: Data)->CurrentWeather {
        let currentWeather = CurrentWeather()
        do{
        let swiftyJson = try JSON(data: APIData)
        
            
        currentWeather.cityName = swiftyJson["name"].stringValue.capitalized
        currentWeather.weatherType = swiftyJson["weather"][0]["main"].stringValue.capitalized
        currentWeather.currentTemp = swiftyJson["main"]["temp"].intValue
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none //we don't care about the time for this app
        let currentDate = dateFormatter.string(from: Date())
        currentWeather.date = "Today, \(currentDate)"
        
        } catch let error as NSError {
            print(error)
        }
        
        //the above 4 lines of swiftyJSON code +3x currentWeather.___ code replaces all of the below "do" block of "if" statements:
        
//        do{
//            let myJson = try JSONSerialization.jsonObject(with: APIData, options: .mutableContainers)
//            if let dict = myJson as? Dictionary<String, AnyObject>{
//                if let name = dict["name"] as? String{
//                    currentWeather.cityName = name
//                }
//
//                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
//                    if let main = weather[0]["main"] as? String{
//                        currentWeather.weatherType = main
//                    }
//                }
//                if let main = dict["main"] as? Dictionary<String, AnyObject>{
//                    if let currentTemp = main["temp"] as? Int {
//                        currentWeather.currentTemp = currentTemp
//                    }
//                }
//                currentWeather.date = "Today"
//            }
//
//        } catch let error as NSError {
//            print(error)
//        }
        
        
        return currentWeather
    }
}
