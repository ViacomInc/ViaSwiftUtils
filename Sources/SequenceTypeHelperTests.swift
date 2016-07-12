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
    
    func test1_FindElement() {
        //for a valid set with elements
        let elements = [1, 2, 3, 4, 5, 6]
        
        //find the ones for an array
        XCTAssertEqual(elements.findFirst({ $0 > 4 }), 5, "Expected first element to be larger then 4 to be 5")
        
        //should also work for dictionaries
        var dict = [String: Int]()
        elements.enumerate().forEach { index, element in
            dict[String(index)] = element
        }
        XCTAssertEqual(dict.findFirst({ $0.1 > 4 })?.1, 5, "Expected first element to be larger then 4 to be 5")
    }
    
    func test2_FindInEmptyArray() {
        //for an empty array
        let elements = [Int]()
        
        XCTAssertEqual(elements.findFirst({ $0 > 0 }), nil, "Expected no element to be found")
    }

    func test3_FindInNonExistent() {
        //for a valid set with elements
        let elements = [1, 2, 3, 4, 5, 6]

        XCTAssertEqual(elements.findFirst({ $0 > 6 }), nil, "Expected no element to be larger then 6")
    }
    
    func test4_FindFirstExistentOfMultiple() {
        struct testElement {
            let number: Int
            let value: Int
        }
        
        // given a set of items with multiple values over 10
        let elements = [testElement(number: 0, value: 10),
                        testElement(number: 1, value: 10),
                        testElement(number: 2, value: 20),
                        testElement(number: 3, value: 10),
                        testElement(number: 4, value: 20),
                        testElement(number: 5, value: 10),
                        testElement(number: 6, value: 20),
                        testElement(number: 7, value: 10)]
        
        XCTAssertEqual(elements.findFirst({ $0.value > 10 })?.number, 2, "Expected first element to be larger then 10 to be 2")
    }
    
    func test5_UniqueElements() {
        //for an already unique arrays of elements
        let elements = [1, 2, 3, 4, 5, 6]
        
        XCTAssertEqual(elements.unique().count, elements.count, "Expected elements to be equal to unique elements")

        //for a bigger array of elements
        let moreElements = [1, 2, 3, 4, 5, 6, 1, 2, 3, 8]
        
        XCTAssertEqual(moreElements.unique().count, 7, "Expected elements to be equal to unique elements")
    }
    
    func test5_ANYALLNONE() {
        //for an array of numbers
        let elements = [1, 2, 3, 4, 5, 6]
        
        XCTAssertTrue(elements.any { $0 > 3}, "Expected 'any number larger 3' to be true")
        XCTAssertTrue(elements.all { $0 > 0}, "Expected 'all to be bigger then 0' to be true")
        XCTAssertTrue(elements.none { $0 < 0}, "Expected 'none to be negative' to be true")
        XCTAssertFalse(elements.any { $0 > 6}, "Expected 'any larger then 6' to be false")
        XCTAssertFalse(elements.all { $0 > 2}, "Expected all to be false")
        XCTAssertFalse(elements.all { $0 > 6}, "Expected all to be false")
        XCTAssertFalse(elements.none { $0 > 1}, "Expected 'none over 1' to be false")
    }
}
