//
//  Date+ComponentAccessors.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 01/09/16.
//
//

import Foundation

public extension Date {

    /// returns the hour of the receiver 'NSDate'
    var hourOfDay: Int {
        return NSCalendar.current.component(.hour, from: self)
    }
    
    /// returns the day of the week of the receiver 'NSDate'
    var dayOfWeek: Int? {
        return NSCalendar.current.component(.weekday, from: self)
    }
    
    /// returns the year of the receiver 'NSDate' as Int anno domini
    var year: Int? {
        return NSCalendar.current.component(.year, from: self)
    }
    
    /// returns the year of the receiver NSDate as localized String anno domini and a fixed dateFormat
    var localizedYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "y"
        return formatter.string(from: self)
    }
}
