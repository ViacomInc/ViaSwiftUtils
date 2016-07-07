//
//  NSBundle+Version.swift
//  PlayPlex
//
//  Created by Kamil Tustanowski on 08.03.2016.
//  Copyright © 2016 Viacom. All rights reserved.
//

public extension NSBundle {
    
    /// fetches the CFBundleShortVersionString from the NSBundle.mainBundle
    static func applicationVersion() -> String? {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String
    }
    
    /// fetches the CFBundleDisplayName from the NSBundle.mainBundle
    static func applicationName() -> String? {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleDisplayName") as? String
    }
}
