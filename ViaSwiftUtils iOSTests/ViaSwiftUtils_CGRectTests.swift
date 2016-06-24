//
//  ViaSwiftUtils_iOSTests.swift
//  ViaSwiftUtils iOSTests
//
//  Created by Konrad Feiler on 24/06/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class ViaSwiftUtils_iOSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test1_two2one() {
        //for a rect sized 10 x 5
        let rect = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 5.0)
        
        XCTAssertEqualWithAccuracy(Double(rect.aspectRatio), 2.0, accuracy: DBL_EPSILON, "Expected Aspect ratio of 2.0");
    }
    
    func test2_zeroWidth() {
        //for a rect sized 0 x 5
        let rect = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 5.0)
        
        XCTAssertEqualWithAccuracy(Double(rect.aspectRatio), 0.0, accuracy: DBL_EPSILON, "Expected Aspect ratio of 0.0");
   }

    func test3_zeroHeight() {
        //for a rect sized 10 x 0
        let rect = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0)
        
        XCTAssertEqualWithAccuracy(Double(rect.aspectRatio), 0.0, accuracy: DBL_EPSILON, "Expected Aspect ratio of 0.0");
    }

    
}
