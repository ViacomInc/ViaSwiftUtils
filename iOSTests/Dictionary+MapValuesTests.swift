//
//  Dictionary+MapValuesTests.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 28/06/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class Dictionary_MapValuesTests: XCTestCase {
    
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
        XCTAssertEqual(Array(dict.keys), Array(mappedDict.keys), "Expected both dicts to have the same keys")
    }
    
}
