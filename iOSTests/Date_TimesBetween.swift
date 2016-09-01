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
        let now = NSDate()
        
        // When comparing to tomorrow
        let tomorrow = NSDate(timeIntervalSinceNow: NSTimeInterval.day)
        // Then
        XCTAssertEqual(now.daysTo(tomorrow), 1, "Expected today to be 1 day from tomorrow")
    }
    
    func testNextMinute() {
        // Given the current date
        let now = NSDate()
        // When comparing to next minute
        let nextMinute = NSDate(timeIntervalSinceNow: NSTimeInterval.minute)
        // Then
        XCTAssertEqual(now.minutesTo(nextMinute), 1, "Expected nextMinute to be 1 minute from now")
    }
    
    func testNextSecond() {
        // Given the current date
        let now = NSDate()
        // When comparing to next second
        let nextSecond = NSDate(timeIntervalSinceNow: NSTimeInterval.second)
        // Then
        XCTAssertEqual(now.secondsTo(nextSecond), 1, "Expected nextSecond to be 1 second from now")
    }
}
