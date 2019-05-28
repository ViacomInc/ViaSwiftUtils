//
//  Array+SafeAccess.swift
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

public extension RandomAccessCollection {
    
    /// Accesses a `RandomAccessCollection`, while being safe from out of bounds errors
    /// Important: Arbitrarily subscripting Arrays in Swift is discouraged,
    ///     when practical, favor iteration like for-in, `map`, `first` etc
    /// - parameter index: The Index at which the access happens
    /// - returns: the element at `index`, if out of bounds returns nil
    subscript (safe index: Self.Index) -> Self.Iterator.Element? {
        return index >= self.startIndex && index < self.endIndex ? self[index] : nil
    }
    
}
