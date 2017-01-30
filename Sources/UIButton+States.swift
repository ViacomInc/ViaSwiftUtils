//
//  UIButton+States.swift
//  Hue
//
//  Created by Raman Nanda on 9/1/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /// Convenience method to set a title for all possible states of the receiver
    /// - parameter title: The title being set
    func setTitleForAllStates(_ title: String?) {
        for controlstate in UIControlState.allValues {
            setTitle(title, for: controlstate)
        }
    }

    /// Convenience method to set a background image for all possible states of the receiver
    /// - parameter image: The image being set for all states
    func setBackgroundImageForAllStates(_ image: UIImage?) {
        for controlstate in UIControlState.allValues {
            setBackgroundImage(image, for: controlstate)
        }
    }

    /// Convenience method to set an image for all possible states of the receiver
    /// - parameter image: The image being set for all states
    func setImageForAllStates(_ image: UIImage?) {
        for controlstate in UIControlState.allValues {
            setImage(image, for: controlstate)
        }
    }
    
    /// Convenience method to set a title color for all possible states of the receiver
    /// - parameter color: The color being set for all states
    func setTitleColorForAllStates(_ color: UIColor?) {
        for controlstate in UIControlState.allValues {
            setTitleColor(color, for: controlstate)
        }
    }

    /// Convenience method to set images for all possible states of the receiver
    ///
    /// - parameter normal:      The image for state .normal
    /// - parameter highlighted: The image for state .highlighted
    /// - parameter selected:    The image for state .selected
    /// - parameter climax:      The image for state [.selected, .highlighted]
    func setImagesForStates(normal: UIImage? = nil, highlighted: UIImage? = nil, selected: UIImage? = nil, climax: UIImage? = nil) {
        self.setImage(normal, for: .normal)
        self.setImage(highlighted, for: .highlighted)
        self.setImage(selected, for: .selected)
        self.setImage(climax, for: [.selected, .highlighted])
    }

}
