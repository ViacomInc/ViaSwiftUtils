//
//  CGVector+OperatorsTest.swift
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

class CGVectorOperatorsTest: XCTestCase {
    
    func testPlusOperator() {
        // Given:
        let vector1 = CGVector(dx: 1.0, dy: 1.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)

        // When:
        let vector3 = vector1 + vector2

        // Then:
        XCTAssertEqual(vector3, CGVector(dx: 2.0, dy: 2.0))
    }

    func testMinusOperator() {
        // Given:
        let vector1 = CGVector(dx: 2.0, dy: 2.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)

        // When:
        let vector3 = vector1 - vector2

        // Then:
        XCTAssertEqual(vector3, CGVector(dx: 1.0, dy: 1.0))
    }

}
