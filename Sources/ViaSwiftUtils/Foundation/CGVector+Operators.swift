//
//  CGVector+Operators.swift
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

import CoreGraphics
import Foundation

public extension CGVector {
    /// Overloads + operator for two CGVectors addition
    ///
    /// - parameter lhs: as lef hand side parameter - CGVector type
    /// - parameter rhs: as right hand side parameter - CGVector type
    ///
    /// - returns: new CGVector calculated from adding two given vectors
    static func + (lhs: CGVector, rhs: CGVector) -> CGVector {
        return self.init(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }

    /// Overloads - operator for two CGVectors substraction
    ///
    /// - parameter lhs: as lef hand side parameter - CGVector type
    /// - parameter rhs: as right hand side parameter - CGVector type
    ///
    /// - returns: new CGVector calculated from substractiong two given vectors
    static func - (lhs: CGVector, rhs: CGVector) -> CGVector {
        return self.init(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
    }
}
