//
//  NibViewTest.swift
//  ViaSwiftUtils
//
//  Created by Patryk Grabowski on 20/10/2016.
//
//

import Foundation


import XCTest
@testable import ViaSwiftUtils


class TestViewController: UIViewController {

    @IBOutlet var horizontalTestViewConstraint: NSLayoutConstraint?
    @IBOutlet var testView: TestViewWithOwner?
    
}


class TestViewWithOwner: NibView {

    @IBOutlet var horizontalLabelConstraint: NSLayoutConstraint?
    @IBOutlet var testLabel: UILabel?

}


class NibView_Test: XCTestCase {

    func testInitializationWithinStoryboard() {
        // Given
        let storyboard = UIStoryboard(name: "TestStoryboard", bundle: Bundle(for: type(of: self)))

        // When
        let testViewController = storyboard.instantiateInitialViewController() as?TestViewController
        let _ = testViewController?.view
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
