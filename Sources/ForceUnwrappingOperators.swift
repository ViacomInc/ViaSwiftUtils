//
//  ForceUnwrappingOperators.swift
//  PlayPlex
//
//  Created by Konrad Feiler on 23/05/16.
//  Copyright © 2016 Viacom. All rights reserved.
//

import Foundation

infix operator !!

// use like this:
// let s = "foo"
// i = Int(s) !! "Expecting integer, got \"\(s)\""
public func !! <T>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    if let x = wrapped { return x }
    fatalError(failureText ())
}

infix operator !?

// use like this:
// let i = Int(s) !? "Expecting integer, got \"\(s)\""
public func !? <T: ExpressibleByIntegerLiteral>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    assert(wrapped != nil, failureText())
    return wrapped ?? 0
}

// use like this:
// let i = Array(s) !? "Expecting array, got \"\(s)\""
public func !? <T: ExpressibleByArrayLiteral>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    assert(wrapped != nil, failureText())
    return wrapped ?? []
}

// use like this:
// let i = String(s) !? "Expecting string, got \"\(s)\""
public func !? <T: ExpressibleByStringLiteral>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    assert(wrapped != nil, failureText())
    return wrapped ?? ""
}

// for arbitraty types, with default value
// Int(s) !? (5, "Expected Integer")
public func !? <T>(wrapped: T?, nilDefault: @autoclosure () -> (value: T, text: String)) -> T {
    assert(wrapped != nil, nilDefault().text)
    return wrapped ?? nilDefault().value
}

// for void methods optional chaines, like in
// var output: String? = nil
// output?.write("something") !? "Wasn't expecting chained nil here"
public func !? (wrapped: ()?, failureText: @autoclosure () -> String) {
    assert(wrapped != nil, failureText)
}
