//
//  NSBundle+Version.swift
//  PlayPlex
//
//  Created by Kamil Tustanowski on 08.03.2016.
//  Copyright © 2016 Viacom. All rights reserved.
//

extension NSBundle {
    
    static func applicationVersion() -> String? {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String
    }
    
    static func applicationName() -> String? {
        return NSBundle.mainBundle().infoDictionary?["CFBundleDisplayName"] as? String
    }
}
