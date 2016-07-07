//
//  NSCalendar+CurrentYear.swift
//  Nickelodeon
//
//  Created by Sebastian Jędruszkiewicz on 29/01/16.
//  Copyright © 2016 Nick Mobile. All rights reserved.
//

import Foundation

public extension NSCalendar {
    
    /// returns the current year using NSDateFormatter and a fixed dateFormat
    static var currentYear: String {
        get {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy"
            return formatter.stringFromDate(NSDate())
        }
    }
}
