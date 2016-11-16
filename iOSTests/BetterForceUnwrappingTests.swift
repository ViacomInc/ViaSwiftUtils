//
//  BetterForceUnwrappingTests.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 16/11/2016.
//
//

import XCTest
@testable import ViaSwiftUtils

class BetterForceUnwrappingTests: XCTestCase {
    
    func testIntegerConvertible() {
        // Given
        let aGoodString = "10"
        let aBadString = "ten"

        // When
        let aGoodInt = Int(aGoodString) !? "Couldn't convert \(aGoodString) to int"
        let aBadInt = Int(aBadString) !? "Couldn't convert \(aBadString) to int"
        
        // Then the good int should be 10
        XCTAssertEqual(aGoodInt, 10)
        // instead of being nil, the bad int should be 0
        XCTAssertEqual(aBadInt, 0)
    }
        
}
