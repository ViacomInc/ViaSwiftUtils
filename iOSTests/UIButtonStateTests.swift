//
//  UIButtonStateTests.swift
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

class UIButtonStateTests: XCTestCase {
    
    func testAllControlStates() {
        // Given
        for state in [UIControl.State.normal, .highlighted, .selected, .disabled, .application, .reserved] {
            
            // When, Then
            XCTAssertTrue(UIControl.State.allValues.contains(state), "Expected allValues to contain \(state)")
        }
    }
    
    func testFunctionsForAllControlStates() {
        // Given a button
        let button = UIButton(type: UIButton.ButtonType.custom)
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
        for state in UIControl.State.allValues {
            //title is set for all states
            XCTAssertEqual(button.title(for: state), title, "Expected title for state \(state) to be \(title)")
            XCTAssertEqual(button.backgroundImage(for: state), backgroundImage, "Expected background image for state \(state) to be backgroundImage")
            XCTAssertEqual(button.image(for: state), frontImage, "Expected image for state \(state) to be frontImage")
            XCTAssertEqual(button.titleColor(for: state), color, "Expected color for state \(state) to be \(color)")
        }

    }

    func testImageForState() {
        // Given
        let button = UIButton(type: UIButton.ButtonType.custom)
        let frontImageNormal = UIImage()
        let frontImageHighlighted = UIImage()
        let frontImageSelected = UIImage()
        let frontImageClimax = UIImage()

        // When
        button.setImagesForStates(normal: frontImageNormal, highlighted: frontImageHighlighted, selected: frontImageSelected, climax: frontImageClimax )

        // Then
        XCTAssertEqual(button.image(for: .normal),
                       frontImageNormal,
                       "Expected image for state \(UIControl.State.normal) to be frontImageNormal")
        XCTAssertEqual(button.image(for: .highlighted),
                       frontImageHighlighted,
                       "Expected image for state \(UIControl.State.highlighted) to be frontImageHighlighted")
        XCTAssertEqual(button.image(for: .selected),
                       frontImageSelected,
                       "Expected image for state \(UIControl.State.selected) to be frontImageSelected")
        XCTAssertEqual(button.image(for: [.selected, .highlighted]),
                       frontImageClimax,
                       "Expected image for state \([UIControl.State.selected, UIControl.State.highlighted]) to be frontImageClimax")
    }

}
