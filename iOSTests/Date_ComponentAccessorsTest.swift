//
//  NSCalender+CurrentYear.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 12/07/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class Date_ComponentAccessorsTest: XCTestCase {
    
    func testDateComponentAsInts() {
        // Given, When
        let eightAM1970 = NSDate(timeIntervalSince1970: 8 * NSTimeInterval.hour + 0.5 * NSTimeInterval.minute)

        // Then
        XCTAssertEqual(eightAM1970.hourOfDay, 9, "Expected 8:00AM 1/1/1970 to be in the 9th hour of the day")
        XCTAssertEqual(eightAM1970.dayOfWeek, 5, "Expected 8:00AM 1/1/1970 to be a thursday")
        XCTAssertEqual(eightAM1970.year, 1970, "Expected 8:00AM 1/1/1970 to be year 1970")
    }

    
    func testCurrentYear() {
        // Given the current date
        let currentYear = NSDate().localizedYear
        
        // Then
        XCTAssertEqual(currentYear.characters.count, 4, "Expected currentyear to have 4 characters")
    }
        
    func testHistoricalYear() {
        // Given the fall of the west roman empire
        let fallOfRome = NSDate(timeIntervalSince1970: -NSTimeInterval.year * (1970 - 476))
        
        // When converting to localized string
        let localizedString = fallOfRome.localizedYear

        // Then
        XCTAssertEqual(localizedString.characters.count, 3, "Expected year of the fall of west rome to have 3 characters")
    }
    
}
