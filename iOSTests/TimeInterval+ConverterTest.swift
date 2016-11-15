//
//  TimeInterval+ConverterTest.swift
//  ViaSwiftUtils
//
//  Created by Patryk Grabowski on 20/10/2016.
//
//

import Foundation
import XCTest
@testable import ViaSwiftUtils

class TimeInterval_ConverterTest: XCTestCase {

    func testToStringMinutes() {
        // Given
        let format = "mm:ss"
        let interval = 600
        let expected = "10:00"
        let timeInterval = TimeInterval(interval)

        // When
        let formattedString = timeInterval.string(withFormat: format)

        // Then
        XCTAssertEqual(formattedString, expected,
                       "Expected string \(expected)")
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
        XCTAssertEqual(formattedString, expected,
                       "Expected string \(expected)")
    }

    func testSecondsToStringYears() {
        // Given
        let format = "yyyy, mm:ss"
        let interval = 360045003
        let expected = "1981, 30:03"
        let timeInterval = TimeInterval(interval)

        // When
        let formattedString = timeInterval.string(withFormat: format)

        // Then
        XCTAssertEqual(formattedString, expected,
                       "Expected string \(expected)")
    }

}
