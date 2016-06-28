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
    func findFirst(@noescape match: (Generator.Element) throws -> Bool) rethrows -> Generator.Element? {
        for element in self where try match(element) {
            return element
        }
        return nil
    }
    
}

public extension SequenceType where Generator.Element: Hashable {
    
    /// Creates an array of unique elements from the elements of the collection
    func unique() -> [Generator.Element] {
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
