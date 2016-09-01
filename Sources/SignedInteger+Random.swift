//
//  SignedInteger+Random.swift
//  ViaSwiftUtils
//
//  Created by Konrad Feiler on 01/09/16.
//
//

import Foundation

public extension SignedInteger {
    
    static func arc4random_uniform(_ upperBound: Self) -> Self {
        precondition(upperBound > 0 && upperBound.toIntMax() < UInt32.max.toIntMax(),
                     "arc4random_uniform only callable up to \(UInt32.max)")
        return numericCast(Darwin.arc4random_uniform(numericCast(upperBound)))
    }
}
