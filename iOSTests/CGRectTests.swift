//
//  ViaSwiftUtils_iOSTests.swift
//  ViaSwiftUtils iOSTests
//
//  Created by Konrad Feiler on 24/06/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class CGRectTests: XCTestCase {
    
    func testRectSize10x5() {
        // Given a rect sized 10 x 5
        let rect = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 5.0)
        
        // Then
        XCTAssertEqualWithAccuracy(Double(rect.aspectRatio), 2.0, accuracy: DBL_EPSILON, "Expected Aspect ratio of 2.0")
    }
    
    func testRectWithZeroWidth() {
        // Given a rect sized 0 x 5
        let rect = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 5.0)
        
        // Then
        XCTAssertEqualWithAccuracy(Double(rect.aspectRatio), 0.0, accuracy: DBL_EPSILON, "Expected Aspect ratio of 0.0")
   }

    func testRectWithZeroHeight() {
        // Given a rect sized 10 x 0
        let rect = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0)
        
        // Then
        XCTAssertEqualWithAccuracy(Double(rect.aspectRatio), 0.0, accuracy: DBL_EPSILON, "Expected Aspect ratio of 0.0")
    }
    
    func testRectWithLinearCombineRectsHalf() {
        // Given two given rects
        let rect1 = CGRect(x: 4.0, y: -4.0, width: 20.0, height: 10.0)
        let rect2 = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 20.0)
        
        // When combined 50:50
        let combinedRect = rect1.linearCombined(with: rect2, by: 0.5)
        
        // Then
        XCTAssertEqualWithAccuracy(Double(combinedRect.origin.x), 2.0,
                                   accuracy: DBL_EPSILON, "Expected x to be 2.0")
        XCTAssertEqualWithAccuracy(Double(combinedRect.origin.y), -2.0,
                                   accuracy: DBL_EPSILON, "Expected y to be -2.0")
        XCTAssertEqualWithAccuracy(Double(combinedRect.size.width), 15,
                                   accuracy: DBL_EPSILON, "Expected width to be 15.0")
        XCTAssertEqualWithAccuracy(Double(combinedRect.size.height), 15.0,
                                   accuracy: DBL_EPSILON, "Expected height to be 15.0")
    }

    func testRectWithLinearCombineRectsIllegalRatio() {
        // Given a two given rects
        let rect1 = CGRect(x: 4.0, y: -4.0, width: 20.0, height: 10.0)
        let rect2 = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 20.0)
        
        // When combined with a value < 0
        let combinedRect = rect1.linearCombined(with: rect2, by: -1.5)
        
        // Then
        XCTAssertEqualWithAccuracy(Double(combinedRect.origin.x), Double(rect1.origin.x),
                                   accuracy: DBL_EPSILON, "Expected x to be equal to rect1.x")

        // When combined with a value > 1
        let combinedRect2 = rect1.linearCombined(with: rect2, by: 1.5)
        
        // Then
        XCTAssertEqualWithAccuracy(Double(combinedRect2.origin.y), Double(rect2.origin.y),
                                   accuracy: DBL_EPSILON, "Expected y to be equal to rect2.y")
    }

    
}
