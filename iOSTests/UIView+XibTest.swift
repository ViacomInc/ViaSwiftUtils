//
//  UIView+XibTest.swift
//  ViaSwiftUtils
//
//  Created by Patryk Grabowski on 20/10/2016.
//
//

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
