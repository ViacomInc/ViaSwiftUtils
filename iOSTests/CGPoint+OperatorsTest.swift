//
//  CGPoint+OperatorsTest.swift
//  ViaSwiftUtils
//
//  Created by Mateusz Fidos on 16.09.2016.
//
//

import XCTest
@testable import ViaSwiftUtils

class CGPoint_OperatorsTest: XCTestCase {

    func test_plusOperatorWithSuccessScenario() {
        // Given:
        let point1 = CGPoint(x: 1.0, y: 1.0)
        let point2 = CGPoint(x: 1.0, y: 1.0)

        // When:
        let point3 = point1 + point2

        // Then:
        XCTAssertEqual(point3, CGPoint(x: 2.0, y: 2.0))
    }

    func test_plusOperatorWithFailureScenario() {
        // Given:
        let point1 = CGPoint(x: 1.0, y: 1.0)
        let point2 = CGPoint(x: 1.0, y: 1.0)

        // When:
        let point3 = point1 + point2

        // Then:
        XCTAssertNotEqual(point3, point1)
    }

    func test_minusOperatorWithSuccessScenario() {
        // Given:
        let point1 = CGPoint(x: 2.0, y: 2.0)
        let point2 = CGPoint(x: 1.0, y: 1.0)

        // When:
        let point3 = point1 - point2

        // Then:
        XCTAssertEqual(point3, CGPoint(x: 1.0, y: 1.0))
    }

    func test_minusOperatorWithFailureScenario() {
        // Given:
        let point1 = CGPoint(x: 2.0, y: 2.0)
        let point2 = CGPoint(x: 1.0, y: 1.0)

        // When:
        let point3 = point1 - point2

        // Then:
        XCTAssertNotEqual(point3, point1)
    }
}
