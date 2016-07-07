//
//  NSDate+TimesBetweenDates.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 07/07/16.
//
//

import Foundation

public extension NSDate {
    
    /// returns the days from the receiver 'NSDate' to the parameter
    /// - parameter date: the date to compare too
    final func daysTo(date: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day], fromDate: self, toDate: date, options: [])
        return components.day
    }
    
    /// returns the minutes from the receiver 'NSDate' to the parameter
    /// - parameter date: the date to compare too
    final func minutesTo(date: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Minute], fromDate: self, toDate: date, options: [])
        return components.minute
    }
    
    /// returns the seconds from the receiver 'NSDate' to the parameter
    /// - parameter date: the date to compare too
    final func secondsTo(date: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Second], fromDate: self, toDate: date, options: [])
        return components.second
    }
    
    /// returns the hour of the receiver 'NSDate'
    final var hourOfDay: Int {
        return NSCalendar.currentCalendar().component(.Hour, fromDate: self)
    }
    
    /// returns the day of the week of the receiver 'NSDate'
    final var dayOfWeek: Int? {
        return NSCalendar.currentCalendar().component(.Weekday, fromDate: self)
    }
    
    /// returns the day of the year of the receiver 'NSDate' as Int anno domini
    final var year: Int? {
        return NSCalendar.currentCalendar().component(.Year, fromDate: self)
    }
}