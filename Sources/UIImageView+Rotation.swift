//
//  UIImageView+ActivityIndicator.swift
//  Hue
//
//  Created by mborace on 03/09/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import UIKit

internal let imageViewRotationAnimationKey = "SpinAnimation"

public extension UIImageView {
    
    public enum AnimationDuration {
        case slow
        case normal
        case fast
        case custom(time: TimeInterval)
        
        internal var duration: TimeInterval {
            switch self {
            case .slow:
                return 2.0
            case .normal:
                return 1.0
            case .fast:
                return 0.5
            case .custom(let time):
                return time
            }
        }
    }
    
    final var isRotating: Bool {
        return layer.animation(forKey: imageViewRotationAnimationKey) != nil
    }
    
    ///  Starts animating the image like an activityIndicator.
    /// - parameter duration: an NSTimeInterval duration the animation should take
    final func startRotating(_ animationDuration: AnimationDuration = .normal, isRemovedOnCompletion: Bool = true) {
        layer.removeAnimation(forKey: imageViewRotationAnimationKey)
        isHidden = false
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(2*M_PI)
        animation.duration = animationDuration.duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = isRemovedOnCompletion
        layer.add(animation, forKey: imageViewRotationAnimationKey)
    }
    
    /// Stops rotating the image
    final func stopRotating() {
        layer.removeAnimation(forKey: imageViewRotationAnimationKey)
        isHidden = true
    }
    
    /// makes the image of UIImageView AlwaysTemplate and sets the tintColor provided
    /// - parameter color: color that is set as a tintColor of the templated image
    final func colorize(_ color: UIColor) {
        if let image = self.image {
            self.image = image.withRenderingMode(.alwaysTemplate)
            tintColor = color
        }
    }
}
