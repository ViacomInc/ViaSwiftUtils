//
//  Date+ComponentAccessors.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 01/09/16.
//
//

import Foundation

public extension NSDate {

    /// returns the hour of the receiver 'NSDate'
    final var hourOfDay: Int {
        return NSCalendar.currentCalendar().component(.Hour, fromDate: self)
    }
    
    /// returns the day of the week of the receiver 'NSDate'
    final var dayOfWeek: Int? {
        return NSCalendar.currentCalendar().component(.Weekday, fromDate: self)
    }
    
    /// returns the year of the receiver 'NSDate' as Int anno domini
    final var year: Int? {
        return NSCalendar.currentCalendar().component(.Year, fromDate: self)
    }
    
    /// returns the year of the receiver NSDate as localized String anno domini and a fixed dateFormat
    final var localizedYear: String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "y"
        return formatter.stringFromDate(self)
    }
}
