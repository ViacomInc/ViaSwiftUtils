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

    // swiftlint:disable:next line_length
    /// [Data Formatting Guide]: https://developer.apple.com/library/prerelease/content/documentation/Cocoa/Conceptual/DataFormatting/DataFormatting.html#//apple_ref/doc/uid/10000029i
    ///
    /// Convenience method returns a string representation of the time interval initialized by using a given format string as a template
    /// relative to 00:00:00 UTC on 1 January 1970.
    ///
    /// See [Data Formatting Guide] for a list of the conversion specifiers permitted in date format strings.
    ///
    /// - Parameter format: The output format of string.
    public func string(withFormat format: String) -> String {
        let date = Date(timeIntervalSince1970: self)
        formatter.dateFormat = format
        return String(formatter.string(from: date))
    }
    
}
