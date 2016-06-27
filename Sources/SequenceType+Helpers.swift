//
//  CollectionType+Helpers.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//
//

import Foundation

public extension SequenceType {
    
    func findFirst(@noescape match: (Generator.Element) throws -> Bool) rethrows -> Generator.Element? {
        for element in self where try match(element) {
            return element
        }
        return nil
    }
    
}

public extension SequenceType where Generator.Element: Hashable {
    
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
