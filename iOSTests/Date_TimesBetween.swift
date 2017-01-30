//
//  Date_TimesBetween.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 01/09/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class Date_TimesBetween: XCTestCase {
    
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
