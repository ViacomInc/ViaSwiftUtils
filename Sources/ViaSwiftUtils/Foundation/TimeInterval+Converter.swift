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

private let formatter = DateFormatter()

extension TimeInterval {
    
    /// Returns a string representation of the time interval representing video or music playtime.
    /// In minutes and seconds, in `en_US` output is for example "4:36" for 4minutes and 36secs.
    /// uses same formatting as Apple Music app across all localizations
    public var asMediaDuration: String {
        let components = DateComponentsFormatter()
        components.zeroFormattingBehavior = .pad
        components.allowedUnits = [.minute, .second]
        components.unitsStyle = .positional
        components.calendar = Locale.current.calendar
        
        return components.string(from: self) ?? "?"
    }

    // swiftlint:disable:next line_length
    /// [Data Formatting Guide]: https://developer.apple.com/library/prerelease/content/documentation/Cocoa/Conceptual/DataFormatting/DataFormatting.html#//apple_ref/doc/uid/10000029i
    ///
    /// Convenience method returns a string representation of the time interval initialized by using a given format string as a template
    /// relative to 00:00:00 UTC on 1 January 1970.
    ///
    /// - Warning: For user facing strings use of `dateStyle`, `timeStyle` or `dateFormat(fromTemplate:options:locale:)`
    ///   should be preferred over this method.
    ///
    /// See [Data Formatting Guide] for a list of the conversion specifiers permitted in date format strings.
    ///
    /// - Parameter format: The output format of string.
    /// - Parameter locale: (optional) locale to use for the string conversion. Defaults to en_US_POSIX.
    public func string(withFormat format: String, locale: Locale = Locale(identifier: "en_US_POSIX")) -> String {
        let date = Date(timeIntervalSince1970: self)
        formatter.dateFormat = format
        formatter.locale = locale
        
        return String(formatter.string(from: date))
    }
    
}
