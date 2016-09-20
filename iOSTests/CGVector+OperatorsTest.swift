//
//  CGVector+OperatorsTest.swift
//  ViaSwiftUtils
//
//  Created by Mateusz Fidos on 16.09.2016.
//
//

import XCTest
@testable import ViaSwiftUtils

class CGVector_OperatorsTest: XCTestCase {
    
    func test_plusOperatorWithSuccessScenario() {
        //Given:
        let vector1 = CGVector(dx: 1.0, dy: 1.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)

        //When:
        let vector3 = vector1 + vector2

        //Then:
        XCTAssertEqual(vector3, CGVector(dx: 2.0, dy: 2.0))
    }

    func test_plusOperatorWithFailureScenario() {
        //Given:
        let vector1 = CGVector(dx: 1.0, dy: 1.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)

        //When:
        let vector3 = vector1 + vector2

        //Then:
        XCTAssertNotEqual(vector3, vector1)
    }

    func test_minusOperatorWithSuccessScenario() {
        //Given:
        let vector1 = CGVector(dx: 2.0, dy: 2.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)

        //When:
        let vector3 = vector1 - vector2

        //Then:
        XCTAssertEqual(vector3, CGVector(dx: 1.0, dy: 1.0))
    }

    func test_minusOperatorWithFailureScenario() {
        //Given:
        let vector1 = CGVector(dx: 2.0, dy: 2.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)

        //When:
        let vector3 = vector1 - vector2
        
        //Then:
        XCTAssertNotEqual(vector3, vector1)
    }
}
