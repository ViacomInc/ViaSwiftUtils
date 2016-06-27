//
//  Dictionary+MapValues.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import Foundation

public extension Dictionary {
    
    mutating func merge<S: SequenceType where S.Generator.Element == (Key, Value)>(other: S) {
        for (key, value) in other {
            self[key] = value
        }
    }
    
    init<S: SequenceType where S.Generator.Element == (Key, Value)>(_ sequence: S) {
        self = [:]
        self.merge(sequence)
    }
    
    func mapValues<NewValue>(transform: Value -> NewValue) -> [Key: NewValue] {
        return Dictionary<Key, NewValue>(map {(key, value) in
            return (key, transform(value))
            })
    }
    
}
