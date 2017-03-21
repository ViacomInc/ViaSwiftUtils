//
//  CGPoint+Operators.swift
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

public extension CGPoint {
    /// Overloads + operator for two CGPoints addition
    ///
    /// - parameter lhs: as lef hand side parameter - CGPoint type
    /// - parameter rhs: as right hand side parameter - CGPoint type
    ///
    /// - returns: new CGPoint calculated from adding two given points
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return self.init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    /// Overloads - operator for two CGPoints substraction
    ///
    /// - parameter lhs: as lef hand side parameter - CGPoint type
    /// - parameter rhs: as right hand side parameter - CGPoint type
    ///
    /// - returns: new CGPoint calculated from substractiong two given points
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return self.init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
