//
//  SequenceTypeHelperTests.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import XCTest

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
        
    
}
