//
//  Date_Comparable.swift
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

class RandomAccessCollectionSafeAccessTests: XCTestCase {
    
    private let testArray = ["zero", "one", "two", "three", "four"]

    func testOutOfBoundsIndex() {
        // Given an index that is out of bounds
        let index = testArray.count
        // then the safe access should return nil
        XCTAssertNil(testArray[safe: index])
    }
    
    func testValidIndex() {
        // Given an index that is inside the bounds
        let index = 3
        // then the correct value is returned
        XCTAssertEqual(testArray[safe: index], "three")
    }
    
    func testNegativeIndex() {
        // Given an index that is out of bounds
        let index = -1
        // then the safe access should return nil
        XCTAssertNil(testArray[safe: index])
    }
    
    private var testSlice: ArraySlice<String> { return testArray[1...3] }

    func testArraySliceOutOfBounds() {
        // Given an out of bounds index is requested
        let outOfBoundsIndex = 0
        // then the safe access should still return the correct value
        XCTAssertNil(testSlice[safe: outOfBoundsIndex])
    }
    
    func testArraySliceInBounds() {
        // Given a value inside the subsclice is asked for
        let validIndex = 1
        // then the safe access should still return the correct value
        XCTAssertEqual(testSlice[safe: validIndex], "one")
    }
    
    func testContiguousArray() {
        // Given a (more efficient) ContiguousArray
        let array = ContiguousArray(testArray)
        // then the safe access should still return the correct value
        XCTAssertEqual(testArray[safe: 1], array[safe: 1])
    }
}
