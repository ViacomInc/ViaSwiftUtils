//
//  CGVector+Operators.swift
//  ViaSwiftUtils
//
//  Created by Mateusz Fidos on 16.09.2016.
//
//

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
