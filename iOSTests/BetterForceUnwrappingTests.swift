//
//  BetterForceUnwrappingTests.swift
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
