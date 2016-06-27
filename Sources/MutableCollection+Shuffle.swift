//
//  MutableCollection+Shuffle.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//

import Foundation

public extension MutableCollectionType where Index == Int {

    /// implements [FisherYates](https://en.wikipedia.org/wiki/Fisher–Yates_shuffle) to shuffle elements in place
    mutating func shuffleInPlace() {
        if count <= 1 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if i == j { continue }
            swap(&self[i], &self[j])
        }
    }
}
