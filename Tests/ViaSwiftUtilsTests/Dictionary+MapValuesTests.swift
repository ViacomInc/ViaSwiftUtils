//
//  Dictionary+MapValuesTests.swift
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

class DictionaryMapValuesTests: XCTestCase {
    
    static var allTests = [
        ("testMergeDictionariesOfEqualType", testMergeDictionariesOfEqualType),
        ("testMergeDictionariesWithOverlappingKeys", testMergeDictionariesWithOverlappingKeys),
        ("testMapValues", testMapValues)
    ]
    
    func testMergeDictionariesOfEqualType() {
        // Given two dictionarys of the same types
        var dict1 = ["One": 1, "Two": 2, "Three": 3]
        let dict2 = ["Four": 10, "Five": 2, "Six": 3]
        
        // When
        dict1.merge(dict2)

        // Then
        XCTAssertEqual(dict1.count, 6, "Expected count of the combined arrays to be 6")
    }
    
    func testMergeDictionariesWithOverlappingKeys() {
        // Given two dictionarys with overlapping keys
        var dict3 = ["One": 1, "Two": 2, "Three": 3]
        let dict4 = ["Four": 10, "Two": 2, "Six": 3]

        // When
        dict3.merge(dict4)
        
        // Then
        XCTAssertEqual(dict3.count, 5, "Expected count of the combined arrays to be 5")
    }
    
    func testMapValues() {
        // Given two dictionarys [String: Int]
        let dict = ["One": 1, "Two": 2, "Three": 3]
        
        // When
        let mappedDict = dict.mapValues { number -> String in
            let numberFormatter = NumberFormatter()
            return numberFormatter.string(from: NSNumber(value: number)) ?? "N.A."
        }
        
        // Then
        XCTAssertEqual(Array(dict.keys.sorted()), Array(mappedDict.keys.sorted()), "Expected both dicts to have the same keys")
    }
    
}
