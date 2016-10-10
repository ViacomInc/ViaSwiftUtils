//
//  TimeInterval+Converter.swift
//  ViaSwiftUtils
//
//  Created by Patryk Grabowski on 10/10/2016.
//
//

import Foundation


fileprivate let formatter = DateFormatter()

extension TimeInterval {

    /// convert time interval to formatted string
    ///
    /// - parameter format: format of output string, by default "mm:ss"
    ///
    /// - returns: formatted String instance which represents time interval
    public func toString(format: String = "mm:ss") -> String {
        let date = Date(timeIntervalSince1970: self)
        formatter.dateFormat = format
        return String(formatter.string(from: date))
    }
    
}
