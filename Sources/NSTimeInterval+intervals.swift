//
//  TimeInterval.swift
//  Hue
//
//  Created by Maximilian Clarke on 19/08/2015.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import Foundation

public extension NSTimeInterval {
    static let second: NSTimeInterval = 1
    static let minute: NSTimeInterval = 60 * second
    static let hour: NSTimeInterval = 60 * minute
    static let day: NSTimeInterval = 24 * hour
    static let week: NSTimeInterval = 7 * day
    static let year: NSTimeInterval = 365 * day
}
