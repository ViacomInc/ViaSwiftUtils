//
//  Locale+Swizzling.swift
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

// swiftlint:disable identifier_name

extension NSLocale {
    @nonobjc static var ttt_locale = "en_US"
    @nonobjc static var ttt_swizzled = false
    
    class func customizedLocale() -> NSLocale {
        return NSLocale(localeIdentifier: NSLocale.ttt_locale)
    }
    
    class func forceLocale(identifier: String) {
        NSLocale.ttt_locale = identifier
        
        print("Swizzling to locale \(identifier)")
        
        if !NSLocale.ttt_swizzled {
            NSLocale.ttt_swizzled = true
            let originalSelector = #selector(getter: NSLocale.current)
            let swizzledSelector = #selector(self.customizedLocale)
            
            let originalMethod = class_getClassMethod(self, originalSelector)
            let swizzledMethod = class_getClassMethod(self, swizzledSelector)
            
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    class func undoForcing() {
        
        print("Undoing the swizzling")
        
        if NSLocale.ttt_swizzled {
            NSLocale.ttt_swizzled = false
            let swizzledSelector = #selector(self.customizedLocale)
            let originalSelector = #selector(getter: NSLocale.current)
            
            let originalMethod = class_getClassMethod(self, originalSelector)
            let swizzledMethod = class_getClassMethod(self, swizzledSelector)
            
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
