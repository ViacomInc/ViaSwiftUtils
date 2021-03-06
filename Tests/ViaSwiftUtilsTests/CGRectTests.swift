//
//  ViaSwiftUtils_iOSTests.swift
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

class CGRectTests: XCTestCase {
    
    static var allTests = [
        ("testRectSize10x5", testRectSize10x5),
        ("testRectWithZeroWidth", testRectWithZeroWidth),
        ("testRectWithZeroHeight", testRectWithZeroHeight),
        ("testRectWithLinearCombineRectsHalf", testRectWithLinearCombineRectsHalf),
        ("testRectWithLinearCombineRectsIllegalRatio", testRectWithLinearCombineRectsIllegalRatio)
    ]
    
    func testRectSize10x5() {
        // Given a rect sized 10 x 5
        let rect = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 5.0)
        
        // Then
        XCTAssertEqual(Double(rect.aspectRatio), 2.0, accuracy: Double.ulpOfOne, "Expected Aspect ratio of 2.0")
    }
    
    func testRectWithZeroWidth() {
        // Given a rect sized 0 x 5
        let rect = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 5.0)
        
        // Then
        XCTAssertEqual(Double(rect.aspectRatio), 0.0, accuracy: Double.ulpOfOne, "Expected Aspect ratio of 0.0")
   }

    func testRectWithZeroHeight() {
        // Given a rect sized 10 x 0
        let rect = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0)
        
        // Then
        XCTAssertEqual(Double(rect.aspectRatio), 0.0, accuracy: Double.ulpOfOne, "Expected Aspect ratio of 0.0")
    }
    
    func testRectWithLinearCombineRectsHalf() {
        // Given two given rects
        let rect1 = CGRect(x: 4.0, y: -4.0, width: 20.0, height: 10.0)
        let rect2 = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 20.0)
        
        // When combined 50:50
        let combinedRect = rect1.linearCombined(with: rect2, by: 0.5)
        
        // Then
        XCTAssertEqual(Double(combinedRect.origin.x), 2.0,
                       accuracy: .ulpOfOne, "Expected x to be 2.0")
        XCTAssertEqual(Double(combinedRect.origin.y), -2.0,
                       accuracy: .ulpOfOne, "Expected y to be -2.0")
        XCTAssertEqual(Double(combinedRect.size.width), 15,
                       accuracy: .ulpOfOne, "Expected width to be 15.0")
        XCTAssertEqual(Double(combinedRect.size.height), 15.0,
                       accuracy: .ulpOfOne, "Expected height to be 15.0")
    }
    
    func testRectWithLinearCombineRectsIllegalRatio() {
        // Given a two given rects
        let rect1 = CGRect(x: 4.0, y: -4.0, width: 20.0, height: 10.0)
        let rect2 = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 20.0)
        
        // When combined with a value < 0
        let combinedRect = rect1.linearCombined(with: rect2, by: -1.5)
        
        // Then
        XCTAssertEqual(Double(combinedRect.origin.x), Double(rect1.origin.x),
                       accuracy: .ulpOfOne, "Expected x to be equal to rect1.x")
        
        // When combined with a value > 1
        let combinedRect2 = rect1.linearCombined(with: rect2, by: 1.5)
        
        // Then
        XCTAssertEqual(Double(combinedRect2.origin.y), Double(rect2.origin.y),
                       accuracy: .ulpOfOne, "Expected y to be equal to rect2.y")
    }

}
