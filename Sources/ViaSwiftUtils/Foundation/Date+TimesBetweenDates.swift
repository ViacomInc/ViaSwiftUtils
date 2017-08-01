//
//  NSDate+TimesBetweenDates.swift
//  ViaSwiftUtils
//
//  Copyright 2017 Viacom, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation

public extension Date {
    
    /// returns the days from the receiver `Date` to the parameter
    /// - parameter date: the date to compare too
    /// - returns: the days between the two dates as Int
    func days(to date: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: date)
        return components.day
    }
    
    /// returns the minutes from the receiver `Date` to the parameter
    /// - parameter date: the date to compare too
    /// - returns: the minutes between the two dates as Int
    func minutes(to date: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: self, to: date)
        return components.minute
    }
    
    /// returns the seconds from the receiver `Date` to the parameter
    /// - parameter date: the date to compare too
    /// - returns: the seconds between the two dates as Int
    func seconds(to date: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.second], from: self, to: date)
        return components.second
    }
}
