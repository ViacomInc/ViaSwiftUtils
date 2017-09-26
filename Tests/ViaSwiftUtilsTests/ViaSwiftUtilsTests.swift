//
//  ViaSwiftUtilsTests.swift
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

import XCTest
@testable import ViaSwiftUtils

class ViaSwiftUtilsTests: XCTestCase {
    
    func testTomorrow() {
        // Given the current date
        let now = Date()
        
        // When comparing to tomorrow
        let tomorrow = Date(timeIntervalSinceNow: TimeInterval.day)
        // Then
        XCTAssertEqual(now.days(to: tomorrow), 1, "Expected today to be 1 day from tomorrow")
    }
        
    func testANYALLNONE() {
        // Given, When
        let elements = [1, 2, 3, 4, 5, 6]
        
        // Then
        XCTAssertTrue(elements.any { $0 > 3 }, "Expected 'any number larger 3' to be true")
        XCTAssertTrue(elements.all { $0 > 0 }, "Expected 'all to be bigger then 0' to be true")
        XCTAssertTrue(elements.none { $0 < 0 }, "Expected 'none to be negative' to be true")
        XCTAssertFalse(elements.any { $0 > 6 }, "Expected 'any larger then 6' to be false")
        XCTAssertFalse(elements.all { $0 > 2 }, "Expected all to be false")
        XCTAssertFalse(elements.all { $0 > 6 }, "Expected all to be false")
        XCTAssertFalse(elements.none { $0 > 1 }, "Expected 'none over 1' to be false")
    }
    
    static var allTests = [
        ("testTomorrow", testTomorrow),
        ("testANYALLNONE", testANYALLNONE)
    ]
}
