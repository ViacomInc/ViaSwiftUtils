//
//  UIControlState+AllStates.swift
//  Hue
//
//  Created by Raman Nanda on 8/27/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import UIKit

extension UIControlState {
    
    /// array of all values of UIControlState
    static var allValues: [UIControlState] {
        return [UIControlState.highlighted,
                UIControlState.selected,
                UIControlState.disabled,
                UIControlState.application,
                UIControlState.reserved]
    }
}
