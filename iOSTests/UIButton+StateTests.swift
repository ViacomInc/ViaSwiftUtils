//
//  UIButton+StateTests.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 12/07/16.
//
//

import XCTest
@testable import ViaSwiftUtils

class UIButton_StateTests: XCTestCase {
    
    func testAllControlStates() {
        // Given
        for state in [UIControlState.normal, .highlighted, .selected, .disabled, .application, .reserved ] {
            
            // When, Then
            XCTAssertTrue(UIControlState.allValues.contains(state), "Expected allValues to contain \(state)")
        }
    }
    
    func testFunctionsForAllControlStates() {
        // Given a button
        let button = UIButton(type: UIButtonType.custom)
        let title = "Click me!"
        let backgroundImage = UIImage()
        let frontImage = UIImage()
        let color = UIColor.brown
        
        // When
        button.setTitleForAllStates(title)
        button.setImageForAllStates(frontImage)
        button.setBackgroundImageForAllStates(backgroundImage)
        button.setTitleColorForAllStates(color)
        
        // Then
        for state in UIControlState.allValues {
            //title is set for all states
            XCTAssertEqual(button.title(for: state), title, "Expected title for state \(state) to be \(title)")
            XCTAssertEqual(button.backgroundImage(for: state), backgroundImage, "Expected background image for state \(state) to be backgroundImage")
            XCTAssertEqual(button.image(for: state), frontImage, "Expected image for state \(state) to be frontImage")
            XCTAssertEqual(button.titleColor(for: state), color, "Expected color for state \(state) to be \(color)")
        }

    }
    
}
