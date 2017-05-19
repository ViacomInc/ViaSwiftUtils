//
//  Array+Helpers.swift
//  ViaSwiftUtils
//
//  Created by Moon, Ethan on 5/18/17.
//
//

import Foundation

public extension Array {
    
    public subscript (safe index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
    
}
