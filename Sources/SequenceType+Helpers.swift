//
//  CollectionType+Helpers.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import Foundation

public extension SequenceType {
    
    /// Find the first matching element in the collection
    /// - parameter match: The predicate the element has to fit
    final func findFirst(@noescape match: (Generator.Element) throws -> Bool) rethrows -> Generator.Element? {
        for element in self where try match(element) {
            return element
        }
        return nil
    }
    
}

public extension SequenceType where Generator.Element: Hashable {
    
    /// Creates an array of unique elements from the elements of the collection
    final func unique() -> [Generator.Element] {
        var seen: Set<Generator.Element> = []
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

public extension SequenceType {
    
    /// Logical method that returns true if at least one element fits the predicate
    /// - parameter predicate: The predicate that the elements are tested with
    final func any(@noescape predicate: (Generator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element) {
            return true
        }
        return false
    }

    /// Logical method that returns true if all elements fit the predicate
    /// - parameter predicate: The predicate that the elements are tested with
    final func all(@noescape predicate: (Generator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try !predicate(element) {
            return false
        }
        return true
    }

    /// Logical method that returns true if none of the elements fit the predicate
    /// - parameter predicate: The predicate that the elements are tested with
    final func none(@noescape predicate: (Generator.Element) throws -> Bool) rethrows -> Bool {
        return try all { try !predicate($0)}
    }

}
