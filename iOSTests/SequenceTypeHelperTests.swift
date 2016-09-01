//
//  SequenceTypeHelperTests.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class SequenceTypeHelperTests: XCTestCase {
    
    func testFindElement() {
        // Given a valid set with elements
        let elements = [1, 2, 3, 4, 5, 6]
        
        // When
        let element = elements.findFirst({ $0 > 4 })
        
        // Then
        XCTAssertEqual(element, 5, "Expected first element to be larger then 4 to be 5")
        
        // When applied to dictionaries
        var dict = [String: Int]()
        elements.enumerate().forEach { index, element in
            dict[String(index)] = element
        }
        
        // Then
        XCTAssertEqual(dict.findFirst({ $0.1 > 4 })?.1, 5, "Expected first element to be larger then 4 to be 5")
    }
    
    func testFindInEmptyArray() {
        // Given an empty array
        let elements = [Int]()
        
        // Then
        XCTAssertEqual(elements.findFirst({ $0 > 0 }), nil, "Expected no element to be found")
    }

    func testFindInNonExistent() {
        // Given a valid set with elements
        let elements = [1, 2, 3, 4, 5, 6]

        // Then
        XCTAssertEqual(elements.findFirst({ $0 > 6 }), nil, "Expected no element to be larger then 6")
    }
    
    private struct testElement {
        let number: Int
        let value: Int
    }
    
    func testFindFirstExistentOfMultiple() {
        // given a set of items with multiple values over 10
        let elements = [testElement(number: 0, value: 10),
                        testElement(number: 1, value: 10),
                        testElement(number: 2, value: 20),
                        testElement(number: 3, value: 10),
                        testElement(number: 4, value: 20),
                        testElement(number: 5, value: 10),
                        testElement(number: 6, value: 20),
                        testElement(number: 7, value: 10)]
        
        // Then
        XCTAssertEqual(elements.findFirst({ $0.value > 10 })?.number, 2, "Expected first element to be larger then 10 to be 2")
    }
    
    func testUniqueElements() {
        // Given an already unique arrays of elements, When
        let elements = [1, 2, 3, 4, 5, 6]
        
        // Then
        XCTAssertEqual(elements.unique().count, elements.count, "Expected elements to be equal to unique elements")

        // Given a bigger array of elements, When
        let moreElements = [1, 2, 3, 4, 5, 6, 1, 2, 3, 8]
        
        // Then
        XCTAssertEqual(moreElements.unique().count, 7, "Expected elements to be equal to unique elements")
    }
    
    func testANYALLNONE() {
        // Given, When
        let elements = [1, 2, 3, 4, 5, 6]
        
        // Then
        XCTAssertTrue(elements.any { $0 > 3}, "Expected 'any number larger 3' to be true")
        XCTAssertTrue(elements.all { $0 > 0}, "Expected 'all to be bigger then 0' to be true")
        XCTAssertTrue(elements.none { $0 < 0}, "Expected 'none to be negative' to be true")
        XCTAssertFalse(elements.any { $0 > 6}, "Expected 'any larger then 6' to be false")
        XCTAssertFalse(elements.all { $0 > 2}, "Expected all to be false")
        XCTAssertFalse(elements.all { $0 > 6}, "Expected all to be false")
        XCTAssertFalse(elements.none { $0 > 1}, "Expected 'none over 1' to be false")
    }
}
