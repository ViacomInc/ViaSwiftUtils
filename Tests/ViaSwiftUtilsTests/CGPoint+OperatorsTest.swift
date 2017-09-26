//
//  CGPoint+OperatorsTest.swift
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

class CGPointOperatorsTest: XCTestCase {

    static var allTests = [
        ("testPlusOperator", testPlusOperator),
        ("testMinusOperator", testMinusOperator)
    ]
    
    func testPlusOperator() {
        // Given:
        let point1 = CGPoint(x: 1.0, y: 1.0)
        let point2 = CGPoint(x: 1.0, y: 1.0)

        // When:
        let point3 = point1 + point2

        // Then:
        XCTAssertEqual(point3, CGPoint(x: 2.0, y: 2.0))
    }

    func testMinusOperator() {
        // Given:
        let point1 = CGPoint(x: 2.0, y: 2.0)
        let point2 = CGPoint(x: 1.0, y: 1.0)

        // When:
        let point3 = point1 - point2

        // Then:
        XCTAssertEqual(point3, CGPoint(x: 1.0, y: 1.0))
    }
}
