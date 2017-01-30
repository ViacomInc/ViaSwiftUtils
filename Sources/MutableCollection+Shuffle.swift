//
//  MutableCollection+Shuffle.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 27/06/16.
//

import Foundation

// swiftlint:disable:next line_length
public extension MutableCollection where Indices.SubSequence: Sequence, Indices.SubSequence.Iterator.Element == Index, Index: Strideable, Index.Stride: SignedInteger {

    /// implements [FisherYates](https://en.wikipedia.org/wiki/Fisher–Yates_shuffle) to shuffle elements in place
    final mutating func shuffleInPlace() {
        if count <= 1 { return }
        
        for i in indices.dropLast() {
            let j = (i..<endIndex).arc4random
            if i == j { continue }
            swap(&self[i], &self[j])
        }
    }
}
