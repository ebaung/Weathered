//
//  Location.swift
//  Weathered
//
//  Created by Deep Thought on 1/25/18.
//  Copyright © 2018 Baung. All rights reserved.
//

import Foundation

class Location{
    static var instance = Location()
    
    fileprivate var _latitude: Double!
    fileprivate var _longitude: Double!
    
    var latitude:Double{
        get {
            return _latitude
        } set {
            _latitude = newValue
        }
    }
    
    var longitude:Double{
        get {
            return _longitude
        } set {
            _longitude = newValue
        }
    }
}
