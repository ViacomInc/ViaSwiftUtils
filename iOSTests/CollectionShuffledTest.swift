//
//  Shuffled.swift
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

import XCTest
@testable import ViaSwiftUtils

class CollectionShuffledTest: XCTestCase {
    
    func testShuffleDoesNotChangeCount() {
        // Given a shuffled
        var mutableNumberList = [1, 2, 3, 4, 5, 6]
        let originalNumbers = mutableNumberList
        
        // When shuffled
        mutableNumberList.shuffleInPlace()

        // Then array should have the same amount of elements
        XCTAssertEqual(originalNumbers.count, mutableNumberList.count,
                       "Expected equal count of shuffled Collection to Original")
    }
    
    func testShuffledArraysKeepElements() {
        // Given hundred random arrays
        for _ in 0..<100 {
            let array = (0..<100).map({_ in  return -100 + Int(arc4random()%200) })
            var shuffledArray = array

            // When shuffled
            shuffledArray.shuffleInPlace()

            // Then each element should occurs in equally often in both original and shuffled array
            for element in array.unique() {
                XCTAssertEqual(shuffledArray.filter({element == $0}).count, array.filter({element == $0}).count,
                               "Expected the same elements in the shuffled array as in the original")
            }
        }
    }
}
