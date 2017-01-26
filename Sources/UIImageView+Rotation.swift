//
//  UIImageView+ActivityIndicator.swift
//  Hue
//
//  Created by mborace on 03/09/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import UIKit

private let rotationAnimationKey = "SpinAnimation"

public extension UIImageView {
    
    enum AnimationDuration {
        case slow
        case normal
        case fast
        case custom(time: TimeInterval)
        
        fileprivate var duration: TimeInterval {
            switch self {
            case .slow:
                return 2.0
            case .normal:
                return 2.0
            case .fast:
                return 2.0
            case .custom(let time):
                return time
            }
        }
    }
    
    final var isRotating: Bool {
        return self.layer.animation(forKey: rotationAnimationKey) != nil
    }
    
    ///  Starts animating the image like an activityIndicator.
    /// - parameter duration: an NSTimeInterval duration the animation should take
    final func startRotating(_ duration: TimeInterval = AnimationDuration.normal.duration) {
        self.layer.removeAllAnimations()
        self.isHidden = false
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(2*M_PI)
        animation.duration = duration
        animation.repeatCount = HUGE
        self.layer.add(animation, forKey: rotationAnimationKey)
    }
    
    /// Stops rotating the image
    final func stopRotating() {
        self.layer.removeAllAnimations()
        self.isHidden = true
    }
    
    /// makes the image of UIImageView AlwaysTemplate and sets the tintColor provided
    /// - parameter color: color that is set as a tintColor of the templated image
    final func colorize(_ color: UIColor) {
        if let image = self.image {
            self.image = image.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.tintColor = color
        }
    }
}
