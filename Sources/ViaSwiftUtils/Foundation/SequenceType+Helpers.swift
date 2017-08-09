//
//  CollectionType+Helpers.swift
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

public extension Sequence where Iterator.Element: Hashable {
    
    /// Creates an array of unique elements from the elements of the collection
    /// - returns: an array containing the unique elements
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter({ (element) -> Bool in
            if seen.contains(element) {
                return false
            } else {
                seen.insert(element)
                return true
            }
        })
    }
    
}

public extension Sequence {
    
    /// Logical method that returns true if at least one element fits the predicate
    /// - returns: a boolean indication whether at least one element fits the predicate
    func any(_ predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element) {
            return true
        }
        return false
    }

    /// Logical method that returns true if all elements fit the predicate
    /// - returns: a boolean indication whether all elements fit the predicate
    func all(_ predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try !predicate(element) {
            return false
        }
        return true
    }

    /// Logical method that returns true if none of the elements fit the predicate
    /// - returns: a boolean indication whether none of the elements fit the predicate
    func none(_ predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        return try all { try !predicate($0) }
    }

}
