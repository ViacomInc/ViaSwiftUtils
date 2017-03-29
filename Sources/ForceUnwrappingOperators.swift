//
//  ForceUnwrappingOperators.swift
//  PlayPlex
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

infix operator !!

/// Use like this:
///
/// `let s = "foo"`
///
/// `i = Int(s) !! "Expecting integer, got \(s)"`
///
/// - Parameters:
///   - wrapped: The Optional(T) value that will be unwrapped
///   - failureText: an autoclosure that will be printed in the case of failure
/// - Returns: The Non-Optional value of Type T
/// - Note:
/// [chapter 'When to Force Unwrap' from Advanced Swift](https://www.objc.io/books/advanced-swift/)

// swiftlint:disable:next force_unwrapping
public func !! <T>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    if let x = wrapped { return x }
    fatalError(failureText ())
}

infix operator !?

/// Use like this:
///
/// `let i = Int(s) !? "Expecting integer, got \(s)"`
///
/// - Parameters:
///   - wrapped: The Optional(T) value that will be unwrapped
///   - failureText: an autoclosure that will be printed in the case of failure
/// - Returns: The Non-Optional value of Type T
/// - Note:
/// [chapter 'When to Force Unwrap' from Advanced Swift](https://www.objc.io/books/advanced-swift/)
public func !? <T: ExpressibleByIntegerLiteral>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    assert(wrapped != nil, failureText())
    return wrapped ?? 0
}

/// use like this:
///
/// `let i = Array(s) !? "Expecting array, got \(s)"`
///
/// - Parameters:
///   - wrapped: The Optional(T) value that will be unwrapped
///   - failureText: an autoclosure that will be printed in the case of failure
/// - Returns: The Non-Optional value of Type T
/// - Note:
/// [chapter 'When to Force Unwrap' from Advanced Swift](https://www.objc.io/books/advanced-swift/)
public func !? <T: ExpressibleByArrayLiteral>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    assert(wrapped != nil, failureText())
    return wrapped ?? []
}

/// use like this:
///
/// `let i = String(s) !? "Expecting string, got \(s)"`
///
/// - Parameters:
///   - wrapped: The Optional(T) value that will be unwrapped
///   - failureText: an autoclosure that will be printed in the case of failure
/// - Returns: The Non-Optional value of Type T
/// - Note:
/// [chapter 'When to Force Unwrap' from Advanced Swift](https://www.objc.io/books/advanced-swift/)
public func !? <T: ExpressibleByStringLiteral>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    assert(wrapped != nil, failureText())
    return wrapped ?? ""
}

/// for arbitraty types, with default value. Used in this way:
///
/// `Int(s) !? (5, "Expected Integer")`
///
/// - Parameters:
///   - wrapped: The Optional(T) value that will be unwrapped
///   - nilDefault: an tuple (value, text) containing a default value and an error Text
/// - Returns: The Non-Optional value of Type T
/// - Note:
/// [chapter 'When to Force Unwrap' from Advanced Swift](https://www.objc.io/books/advanced-swift/)
public func !? <T>(wrapped: T?, nilDefault: @autoclosure () -> (value: T, text: String)) -> T {
    assert(wrapped != nil, nilDefault().text)
    return wrapped ?? nilDefault().value
}

/// for void methods optional chains, like in
///
/// `var output: String? = nil`
///
/// `output?.write("something") !? "Wasn't expecting chained nil here"`
///
/// - Parameters:
///   - wrapped: The Optional(T) value that will be unwrapped
///   - failureText: an autoclosure that will be printed in the case of failure
/// - Returns: The Non-Optional value of Type T
/// - Note:
/// [chapter 'When to Force Unwrap' from Advanced Swift](https://www.objc.io/books/advanced-swift/)
public func !? (wrapped: ()?, failureText: @autoclosure () -> String) {
    assert(wrapped != nil, failureText)
}
