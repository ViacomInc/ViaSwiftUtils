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
    
    func testComparable() {
        // Given, When
        let earlyDate = Date(timeIntervalSince1970: 0)
        let laterDate = Date(timeIntervalSince1970: 1000)
        let otherDate = Date(timeIntervalSince1970: 1000)
        
        // Then
        XCTAssertTrue(earlyDate < laterDate, "Expected earlyDate to be before laterDate")
        XCTAssertTrue(laterDate > earlyDate, "Expected earlyDate to be before laterDate")
        XCTAssertTrue(otherDate == laterDate, "Expected otherDate to be equal laterDate")
    }
}
