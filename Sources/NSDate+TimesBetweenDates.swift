//
//  NSDate+TimesBetweenDates.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 07/07/16.
//
//

import Foundation

public extension Date {
    
    /// returns the days from the receiver 'NSDate' to the parameter
    /// - parameter date: the date to compare too
    /// - returns: the days between the two dates as Int
    func days(to date: Date) -> Int? {
        let calendar = NSCalendar.current
        let components = (calendar as NSCalendar).components([.weekday], from: self, to: date, options: [])
        return components.day
    }
    
    /// returns the minutes from the receiver 'NSDate' to the parameter
    /// - parameter date: the date to compare too
    /// - returns: the minutes between the two dates as Int
    func minutes(to date: Date) -> Int? {
        let calendar = NSCalendar.current
        let components = (calendar as NSCalendar).components([.minute], from: self, to: date, options: [])
        return components.minute
    }
    
    /// returns the seconds from the receiver 'NSDate' to the parameter
    /// - parameter date: the date to compare too
    /// - returns: the seconds between the two dates as Int
    func seconds(to date: Date) -> Int? {
        let calendar = NSCalendar.current
        let components = (calendar as NSCalendar).components([.second], from: self, to: date, options: [])
        return components.second
    }
}
