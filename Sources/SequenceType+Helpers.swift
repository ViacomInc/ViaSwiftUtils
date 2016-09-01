//
//  CollectionType+Helpers.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import Foundation

public extension Sequence {
    
    /// Find the first matching element in the collection
    /// - returns: the found element. Optional.
    final func findFirst(_ match: (Iterator.Element) throws -> Bool) rethrows -> Iterator.Element? {
        for element in self where try match(element) {
            return element
        }
        return nil
    }
    
}

public extension Sequence where Iterator.Element: Hashable {
    
    /// Creates an array of unique elements from the elements of the collection
    /// - returns: an array containing the unique elements
    final func unique() -> [Iterator.Element] {
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
    final func any(_ predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element) {
            return true
        }
        return false
    }

    /// Logical method that returns true if all elements fit the predicate
    /// - returns: a boolean indication whether all elements fit the predicate
    final func all(_ predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try !predicate(element) {
            return false
        }
        return true
    }

    /// Logical method that returns true if none of the elements fit the predicate
    /// - returns: a boolean indication whether none of the elements fit the predicate
    final func none(_ predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        return try all { try !predicate($0)}
    }

}
