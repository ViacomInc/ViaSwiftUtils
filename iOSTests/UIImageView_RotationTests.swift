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
    
    func testIsRotating() {
        // Given, When
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        // Then
        XCTAssertFalse(imageView.isRotating, "Expected imageView to not be rotating before starts")
    }
    
    func testStartRotating() {
        // Given, When
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        // When
        imageView.startRotating()

        // Then
        XCTAssertTrue(imageView.isRotating, "Expected imageView to be rotating after startRotating")
    }
    
    func testStopRotating() {
        // Given, When
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        // When
        imageView.startRotating()
        imageView.stopRotating()

        // Then
        XCTAssertFalse(imageView.isRotating, "Expected imageView to not be rotating after stopRotating")
    }
    
}
