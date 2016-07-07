//
//  NSDate+Comparable.swift
//  Hue
//
//  Created by Martino Buffolino on 8/21/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

extension NSDate: Comparable {}

public func == (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

public func > (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedDescending
}
