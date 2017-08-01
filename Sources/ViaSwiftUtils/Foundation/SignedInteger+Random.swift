//
//  SignedInteger+Random.swift
//  ViaSwiftUtils
//
//  Copyright 2017 Viacom, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation

public extension SignedInteger {
    
    static func arc4random_uniform(_ upperBound: Self) -> Self {
        precondition(upperBound > 0 && upperBound.toIntMax() < UInt32.max.toIntMax(),
                     "arc4random_uniform only callable up to \(UInt32.max)")
        #if os(OSX) || os(iOS) || os(tvOS)
            return numericCast(Darwin.arc4random_uniform(numericCast(upperBound)))
        #elseif os(Linux) || CYGWIN
            srandom(UInt32(time(nil)))
            return numericCast(UInt32(random() % numericCast(upperBound)))
        #endif
    }
}
