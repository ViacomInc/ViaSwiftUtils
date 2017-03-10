//
//  TimeInterval+Converter.swift
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
