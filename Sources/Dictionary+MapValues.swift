//
//  Dictionary+MapValues.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import Foundation

public extension Dictionary {
    
    /// Merges the Dictionary with a Sequence of (Key, Value)
    /// - parameter other: The Sequence that is merged in
    mutating func merge<S: Sequence>(_ other: S) where S.Iterator.Element == (Key, Value) {
        for (key, value) in other {
            self[key] = value
        }
    }

    /// Initializes a Dictionary with a Sequence of (Key, Value)
    /// - parameter sequence: The Sequence of elements that this Dictionary will contain after initialization
    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (Key, Value) {
        self = [:]
        self.merge(sequence)
    }

    /// Maps the values of a dictionary into new values, creating a new dictionary with the same keys
    /// - parameter transform: The transformation the values will be going through
    /// - returns: new dictionary with the mapped values but the same keys
    func mapValues<NewValue>(_ transform: (Value) -> NewValue) -> [Key: NewValue] {
        return Dictionary<Key, NewValue>(map {(key, value) in
            return (key, transform(value))
            })
    }
    
}
