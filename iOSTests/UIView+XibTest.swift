//
//  UIView+XibTest.swift
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
import XCTest
@testable import ViaSwiftUtils

class XibView: UIView { }
class TestViewWithoutOwner: UIView { }

class UIView_XibTest: XCTestCase {

    let expectedSubviewType = String(describing: XibView.self)

    func testLoadNibView() {
        // Given
        let frame = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
        let testView = TestViewWithoutOwner(frame: frame)
        let owner = testView
        let expectedNumberOfSubviews = 1

        // When
        testView.loadNibView(owner)

        // Then
        XCTAssertEqual(testView.subviews.count, expectedNumberOfSubviews,
                       "Expected number of subviews to be \(expectedNumberOfSubviews)")
        
        let subviewType = String(describing: type(of: testView.subviews[0]))
        XCTAssertEqual(subviewType, expectedSubviewType,
                       "Expected subview type to be \(expectedSubviewType)")
    }

    func testLoadFromNib() {
        // Given
        let nibName = String(describing: TestViewWithoutOwner.self)
        let bundle = Bundle(for: TestViewWithoutOwner.self)

        // When
        let view = UIView.loadFromNib(named: nibName, bundle: bundle)

        // Then
        XCTAssertNotNil(view, "Expected view not to be nil")
        view.map {
            let subviewType = String(describing: type(of: $0))
            XCTAssertEqual(subviewType, expectedSubviewType,
                           "Expected view type to be \(expectedSubviewType)")
        }
    }

}
