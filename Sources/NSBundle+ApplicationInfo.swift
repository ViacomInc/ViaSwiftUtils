//
//  NSBundle+Version.swift
//  PlayPlex
//
//  Created by Kamil Tustanowski on 08.03.2016.
//  Copyright © 2016 Viacom. All rights reserved.
//

public extension Bundle {
    
    /// fetches the CFBundleShortVersionString from the NSBundle.mainBundle
    /// - returns: the version as a String
    static func applicationVersion() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    /// fetches the CFBundleDisplayName from the NSBundle.mainBundle
    /// - returns: the version as a String
    static func applicationName() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
