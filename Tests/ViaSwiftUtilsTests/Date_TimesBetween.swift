//
//  Date_TimesBetween.swift
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

class DateTimesBetweenTests: XCTestCase {
    
    static var allTests = [
        ("testTomorrow", testTomorrow),
        ("testNextMinute", testNextMinute),
        ("testNextSecond", testNextSecond)
    ]
    
    func testTomorrow() {
        // Given the current date
        let now = Date()
        
        // When comparing to tomorrow
        let tomorrow = Date(timeIntervalSinceNow: TimeInterval.day)
        // Then
        XCTAssertEqual(now.days(to: tomorrow), 1, "Expected today to be 1 day from tomorrow")
    }
    
    func testNextMinute() {
        // Given the current date
        let now = Date()
        // When comparing to next minute
        let nextMinute = Date(timeIntervalSinceNow: TimeInterval.minute)
        // Then
        XCTAssertEqual(now.minutes(to: nextMinute), 1, "Expected nextMinute to be 1 minute from now")
    }
    
    func testNextSecond() {
        // Given the current date
        let now = Date()
        // When comparing to next second
        let nextSecond = Date(timeIntervalSinceNow: TimeInterval.second)
        // Then
        XCTAssertEqual(now.seconds(to: nextSecond), 1, "Expected nextSecond to be 1 second from now")
    }
}
