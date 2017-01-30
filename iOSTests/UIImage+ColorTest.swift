//
//  UIImage+ColorTest.swift
//  ViaSwiftUtils
//
//  Created by Patryk Grabowski on 20/10/2016.
//
//

import XCTest
@testable import ViaSwiftUtils

class UIButton_ColorTest: XCTestCase {

    func testConvenienceFailableInitializer() {
        // Given
        let black = UIColor.black
        let defaultSize = CGSize(width: 1.0 * UIScreen.main.scale, height: 1.0 * UIScreen.main.scale)

        // When
        let image = UIImage(color: black)

        // Then
        XCTAssertNotNil(image,
                        "Expected image should not be nil")
        XCTAssertEqual(image?.size, defaultSize,
                       "Expected image size to be \(defaultSize)")
    }

}
