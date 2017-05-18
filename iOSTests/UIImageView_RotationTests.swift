//
//  UIImageView_RotationTests.swift
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
    
    func testSlowIsSlowerThanNormal() {
        // Given, When
        let slow = UIImageView.AnimationDuration.slow
        let normal = UIImageView.AnimationDuration.normal
        
        // Then
        XCTAssertGreaterThan(slow.duration, normal.duration, "Expected slow duration to be slower than normal duration")
    }
    
    func testNormalIsSlowerThanFast() {
        // Given, When
        let normal = UIImageView.AnimationDuration.normal
        let fast = UIImageView.AnimationDuration.fast
        
        // Then
        XCTAssertGreaterThan(normal.duration, fast.duration, "Expected normal duration to be slower than fast duration")
    }
    
    func testCustomIsWhatYouGiveIt() {
        // Given, When
        let custom = UIImageView.AnimationDuration.custom(time: 0.2)
        
        // Then
        XCTAssertEqual(custom.duration, 0.2, "Expected custom duration to be exactly what you give it")
    }
    
    func testIsRemovedOnCompletion() {
        // Given
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        // When
        imageView.startRotating(isRemovedOnCompletion: false)
        
        // Then
        if let animation = imageView.layer.animation(forKey: imageViewRotationAnimationKey) {
            XCTAssertFalse(animation.isRemovedOnCompletion)
        } else {
            XCTFail("imageView is missing animation for \(imageViewRotationAnimationKey)")
        }
    }
    
}
