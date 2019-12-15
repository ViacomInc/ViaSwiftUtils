//
//  Dictionary+MapValues.swift
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

public extension Dictionary {

    /// Merges the Dictionary with a Sequence of (Key, Value)
    /// - parameter other: The Sequence that is merged in
    mutating func merge<S: Sequence>(_ other: S) where S.Iterator.Element == Element {
        for (key, value) in other {
            self[key] = value
        }
    }

    /// Initializes a Dictionary with a Sequence of (Key, Value)
    /// - parameter sequence: The Sequence of elements that this Dictionary will contain after initialization
    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self = [:]
        self.merge(sequence)
    }

    /// Maps the values of a dictionary into new values, creating a new dictionary with the same keys
    /// - parameter transform: The transformation the values will be going through
    /// - returns: new dictionary with the mapped values but the same keys
    func mapValues<NewValue>(_ transform: (Value) -> NewValue) -> [Key: NewValue] {
        return [Key: NewValue](map { key, value in
            (key, transform(value))
        })
    }
}
