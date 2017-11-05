//
//  NSCalender+CurrentYear.swift
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

@testable import ViaSwiftUtils
import XCTest

class DateComponentAccessorsTest: XCTestCase {
    
    static var allTests = [
        ("testDateComponentAsInts", testDateComponentAsInts),
        ("testCurrentYear", testCurrentYear),
        ("testHistoricalYear", testHistoricalYear)
    ]
    
    func testDateComponentAsInts() {
        // Given
        let eightAM1970 = Date(timeIntervalSince1970: 8 * TimeInterval.hour + 0.5 * TimeInterval.minute)

        // When in UTC time zone then
        if let utcZone = TimeZone(abbreviation: "UTC") { NSTimeZone.default = utcZone }
        
        // Then
        XCTAssertEqual(eightAM1970.hourOfDay, 8, "Expected 8:00AM 1/1/1970 to be in the 8th hour of the day")
        XCTAssertEqual(eightAM1970.dayOfWeek, 5, "Expected 8:00AM 1/1/1970 to be a thursday")
        XCTAssertEqual(eightAM1970.year, 1970, "Expected 8:00AM 1/1/1970 to be year 1970")
    }

    func testCurrentYear() {
        // Given the current date
        let currentYear = Date().localizedYear
        
        // Then
        XCTAssertEqual(currentYear.count, 4, "Expected currentyear to have 4 characters")
    }
        
    func testHistoricalYear() {
        // Given the fall of the west roman empire
        let fallOfRome = Date(timeIntervalSince1970: -TimeInterval.year * (1970 - 476))
        
        // When converting to localized string
        let localizedString = fallOfRome.localizedYear

        // Then
        XCTAssertEqual(localizedString.count, 3, "Expected year of the fall of west rome to have 3 characters")
    }
    
}
