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
    
    func testForceUnwrapping() {
        // Given
        let someURLString = "www.test.com/something"
        
        // When
        // swiftlint:disable:next force_unwrapping
        let url = NSURL(string: someURLString) !! "ERROR: \(someURLString) isn't url convertible"
        
        // Then
        XCTAssertEqual(url.path, someURLString)
    }
    
    func testIntegerConvertible() {
        // Given
        let aSampleString = "10"
        
        // When
        let anInt = Int(aSampleString) !? "WARNING: Couldn't convert \(aSampleString) to int"
        
        // Then
        XCTAssertEqual(anInt, 10)
    }
    
    func testStringConvertible() {
        // Given
        let anUTF16View = "abc".utf16
        
        // When
        let aString = String(anUTF16View) !? "WARNING: Couldn't convert \(anUTF16View) to String"
        
        // Then
        XCTAssertEqual(aString, "abc")
    }
    
    func testGeneralConvertible() {
        // Given
        let someURLString = "www.test.com/something"
        
        // When
        let url = NSURL(string: someURLString) !? (NSURL(), "WARNING: \(someURLString) isn't url convertible")
        
        // Then
        XCTAssertEqual(url.path, someURLString)
    }
    
}
