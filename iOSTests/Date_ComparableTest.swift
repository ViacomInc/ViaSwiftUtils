//
//  Date_Comparable.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 12/07/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class Date_ComparableTest: XCTestCase {
    
    func test1_Comparable() {
        //given two dates
        let earlyDate = NSDate(timeIntervalSince1970: 0)
        let laterDate = NSDate(timeIntervalSince1970: 1000)
        let otherDate = NSDate(timeIntervalSince1970: 1000)
        
        //then
        XCTAssertTrue(earlyDate < laterDate, "Expected earlyDate to be before laterDate")
        XCTAssertTrue(laterDate > earlyDate, "Expected earlyDate to be before laterDate")
        XCTAssertTrue(otherDate == laterDate, "Expected otherDate to be equal laterDate")
    }
    
    func test1_TimesBetweenDates() {
        //given two dates
        let now = NSDate()
        let tomorrow = NSDate(timeIntervalSinceNow: NSTimeInterval.day)
        
        //then
        XCTAssertEqual(now.daysTo(tomorrow), 1, "Expected today to be 1 day from tomorrow")
        
        //given
        let nextMinute = NSDate(timeIntervalSinceNow: NSTimeInterval.minute)
        
        //then
        XCTAssertEqual(now.minutesTo(nextMinute), 1, "Expected nextMinute to be 1 minute from now")
     
        //given
        let nextSecond = NSDate(timeIntervalSinceNow: NSTimeInterval.second)
        //then
        XCTAssertEqual(now.secondsTo(nextSecond), 1, "Expected nextSecond to be 1 second from now")
        
        //given
        let eightAM1970 = NSDate(timeIntervalSince1970: 8 * NSTimeInterval.hour + 0.5 * NSTimeInterval.minute)
        //then
        XCTAssertEqual(eightAM1970.hourOfDay, 9, "Expected 8:00AM 1/1/1970 to be in the 9th hour of the day")
        XCTAssertEqual(eightAM1970.dayOfWeek, 5, "Expected 8:00AM 1/1/1970 to be a thursday")
        XCTAssertEqual(eightAM1970.year, 1970, "Expected 8:00AM 1/1/1970 to be year 1970")
    }
    
}
