//
//  NSDate.swift
//  Weathered
//
//  Created by Eugene Baung on 1/6/18.
//  Copyright © 2018 Baung. All rights reserved.
//


/*
 y = year
 Q = quarter
 M = month
 w = week of year
 W = week of month
 d = day of month
 D = day of year
 E = day of week
 a = period (AM or PM)
 h = hour (1-12)
 H = hour (0-23)
 m = minute
 s = second
 */



import Foundation

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, yyyy, MMM, dd, H"   // 1x "E" = short day format (Mon, Tue, Wed, etc); 4x "E" = long day format (Monday, Tuesday, Wednesday, etc.)
        return dateFormatter.string(from: self)
    }
}
