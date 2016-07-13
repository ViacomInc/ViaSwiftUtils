//
//  UIImageView_RotationTests.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 12/07/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class UIImageView_RotationTests: XCTestCase {
    
    func test1_Rotation() {
        //given a UIImageView
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        XCTAssertFalse(imageView.isRotating, "Expected imageView to not be rotating before starts")

        imageView.startRotating()
        XCTAssertTrue(imageView.isRotating, "Expected imageView to be rotating after startRotating")

        imageView.stopRotating()
        XCTAssertFalse(imageView.isRotating, "Expected imageView to not be rotating after stopRotating")
    }
    
}
