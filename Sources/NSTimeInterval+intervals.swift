//
//  TimeInterval.swift
//  Hue
//
//  Created by Maximilian Clarke on 19/08/2015.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import Foundation

public extension TimeInterval {
    static let second: TimeInterval = 1
    static let minute: TimeInterval = 60 * second
    static let hour: TimeInterval = 60 * minute
    static let day: TimeInterval = 24 * hour
    static let week: TimeInterval = 7 * day
    static let year: TimeInterval = 365 * day
}
