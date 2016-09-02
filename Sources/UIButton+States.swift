//
//  UIButton+States.swift
//  Hue
//
//  Created by Raman Nanda on 9/1/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// convenience method to set a title for all possible states of the receiver
    /// - parameter title: the title being set
    final func setTitleForAllStates(_ title: String?) {
        for controlstate in UIControlState.allValues {
            setTitle(title, for: controlstate)
        }
    }

    /// convenience method to set a background image for all possible states of the receiver
    /// - parameter image: the image being set for all states
    final func setBackgroundImageForAllStates(_ image: UIImage?) {
        for controlstate in UIControlState.allValues {
            setBackgroundImage(image, for: controlstate)
        }
    }

    /// convenience method to set an image for all possible states of the receiver
    /// - parameter image: the image being set for all states
    final func setImageForAllStates(_ image: UIImage?) {
        for controlstate in UIControlState.allValues {
            setImage(image, for: controlstate)
        }
    }
    
    /// convenience method to set a title color for all possible states of the receiver
    /// - parameter color: the color being set for all states
    final func setTitleColorForAllStates(_ color: UIColor?) {
        for controlstate in UIControlState.allValues {
            setTitleColor(color, for: controlstate)
        }
    }
    
}
