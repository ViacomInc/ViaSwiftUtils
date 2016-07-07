//
//  UIButton+States.swift
//  Hue
//
//  Created by Raman Nanda on 9/1/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import Foundation

extension UIButton {
    
    /// convenience method to set a title for all possible states of the receiver
    /// - parameter title: the title being set
    final func setTitleForAllStates(title: String?) {
        for controlstate in UIControlState.allValues {
            setTitle(title, forState: controlstate)
        }
    }

    /// convenience method to set a background image for all possible states of the receiver
    /// - parameter image: the image being set for all states
    final func setBackgroundImageForAllStates(image: UIImage?) {
        for controlstate in UIControlState.allValues {
            setBackgroundImage(image, forState: controlstate)
        }
    }

    /// convenience method to set an image for all possible states of the receiver
    /// - parameter image: the image being set for all states
    final func setImageForAllStates(image: UIImage?) {
        for controlstate in UIControlState.allValues {
            setImage(image, forState: controlstate)
        }
    }
    
    /// convenience method to set a title color for all possible states of the receiver
    /// - parameter image: the color being set for all states
    final func setTitleColorForAllStates(color: UIColor?) {
        for controlstate in UIControlState.allValues {
            setTitleColor(color, forState: controlstate)
        }
    }
    
}
