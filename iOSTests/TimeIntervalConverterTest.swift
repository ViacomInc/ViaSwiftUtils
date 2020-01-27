//
//  TimeIntervalConverterTest.swift
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
@testable import ViaSwiftUtils
import XCTest

class TimeIntervalConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        NSLocale.forceLocale(identifier: "en_US")
    }
    
    override func tearDown() {
        super.tearDown()
        
        NSLocale.undoForcing()
    }
    
    func testMediaDuration() {
        // Given
        let interval: TimeInterval = 18 * 60 + 37
        
        // When
        let formattedString = interval.asMediaDuration
        
        // Then
        let expected = "18:37"
        XCTAssertEqual(formattedString, expected, "Expected string \(expected)")
    }

    func testToStringMinutes() {
        // Given
        let format = "mm:ss"
        let interval = 600
        let expected = "10:00"
        let timeInterval = TimeInterval(interval)

        // When
        let formattedString = timeInterval.string(withFormat: format)

        // Then
        XCTAssertEqual(formattedString, expected, "Expected string \(expected)")
    }

    func testSecondsToStringHours() {
        // Given
        let format = "mm:ss"
        let interval = 3603
        let expected = "00:03"
        let timeInterval = TimeInterval(interval)

        // When
        let formattedString = timeInterval.string(withFormat: format)

        // Then
        XCTAssertEqual(formattedString, expected, "Expected string \(expected)")
    }

    func testSecondsToStringYears() {
        // Given
        let format = "yyyy, mm:ss"
        let interval = 360_045_003
        let expected = "1981, 30:03"
        let timeInterval = TimeInterval(interval)

        // When
        let formattedString = timeInterval.string(withFormat: format)

        // Then
        XCTAssertEqual(formattedString, expected, "Expected string \(expected)")
    }
    
}
