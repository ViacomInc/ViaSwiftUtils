//
//  String+Localized.swift
//  Hue
//
//  Created by Konrad Feiler on 20/08/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import UIKit

extension String {

    /// localized version of this string using it as a key in Localizable.strings in the main Bundle
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    /// localized uppercase version of this string, with newline characters escaped
    var customLocalizedUppercaseString: String {
        if #available(iOS 9, *) {
            return self.localizedUppercase.replacingOccurrences(of: "\\N", with: "\n")
        } else {
            return self.uppercased(with: NSLocale.current)
                .replacingOccurrences(of: "\\N", with: "\n")
        }
    }
}
