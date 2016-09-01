//
//  Range+Random.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 01/09/16.
//
//

import Foundation

public extension CountableRange {
    
    var arc4random: Bound {
        return lowerBound.advanced(by: Bound.Stride.arc4random_uniform(count))
    }
}
