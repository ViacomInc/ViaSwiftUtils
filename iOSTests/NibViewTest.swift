//
//  NibViewTest.swift
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

import Foundation
@testable import ViaSwiftUtils
import XCTest

class TestViewController: UIViewController {

    @IBOutlet fileprivate var horizontalTestViewConstraint: NSLayoutConstraint?
    @IBOutlet fileprivate var testView: TestViewWithOwner?
    
}

class TestViewWithOwner: NibView {

    @IBOutlet fileprivate var horizontalLabelConstraint: NSLayoutConstraint?
    @IBOutlet fileprivate var testLabel: UILabel?

}

class NibViewTest: XCTestCase {

    func testInitializationWithinStoryboard() {
        // Given
        let storyboard = UIStoryboard(name: "TestStoryboard", bundle: Bundle(for: type(of: self)))

        // When
        let testViewController = storyboard.instantiateInitialViewController() as? TestViewController
        _ = testViewController?.view
        let testView = testViewController?.testView

        // Then
        XCTAssertNotNil(testViewController)
        XCTAssertNotNil(testViewController?.testView)
        XCTAssertNotNil(testViewController?.horizontalTestViewConstraint)
        XCTAssertNotNil(testView)
        XCTAssertNotNil(testView?.testLabel)
        XCTAssertNotNil(testView?.horizontalLabelConstraint)
    }

    func testInitializationWithFrame() {
        // Given
        let frame = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
        let expectedNumberOfSubviews = 1
        let expectedSubviewType = String(describing: XibView.self)

        // When
        let testView = TestViewWithOwner(frame: frame)

        // Then
        XCTAssertEqual(testView.subviews.count, expectedNumberOfSubviews,
                       "Expected number of subviews to be \(expectedNumberOfSubviews)")

        let subviewType = String(describing: type(of: testView.subviews[0]))
        XCTAssertEqual(subviewType, expectedSubviewType,
                       "Expected subview type to be \(expectedSubviewType)")
    }

    func testInitializationWithCoder() {
        // Given
        let frame = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
        let expectedNumberOfSubviews = 1
        let expectedSubviewType = String(describing: XibView.self)
        let archivePath = NSTemporaryDirectory().appending("testView")

        // When
        let testView = TestViewWithOwner(frame: frame)
        NSKeyedArchiver.archiveRootObject(testView, toFile: archivePath)
        let unarchivedTestView = NSKeyedUnarchiver.unarchiveObject(withFile: archivePath) as? TestViewWithOwner

        // Then
        XCTAssertNotNil(unarchivedTestView, "Expected unarchived view not to be nil")
        unarchivedTestView.map {
            XCTAssertEqual($0.subviews.count, expectedNumberOfSubviews,
                           "Expected number of subviews to be \(expectedNumberOfSubviews)")

            let subviewType = String(describing: type(of: $0.subviews[0]))
            XCTAssertEqual(subviewType, expectedSubviewType,
                           "Expected subview type to be \(expectedSubviewType)")
        }
    }

}
