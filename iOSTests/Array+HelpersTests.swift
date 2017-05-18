//
//  Array+HelpersTests.swift
//  ViaSwiftUtils
//
//  Created by Moon, Ethan on 5/18/17.
//
//

import XCTest
@testable import ViaSwiftUtils

class Array_HelpersTests: XCTestCase {
    
    private let testArray = ["zero", "one", "two", "three", "four"]
    
    func testIndexOverflow() {
        // Input an overflow index to check a nil is returned
        XCTAssertNil(testArray[safe: 5])
    }
    
    func testValidIndex() {
        // Input a valid index to check proper value is returned
        XCTAssertEqual(testArray[safe: 2], "two")
    }
    
    func testNegativeIndex() {
        // Input a negative index to check a nil is returned
        XCTAssertNil(testArray[safe: -1])
    }
    
}
