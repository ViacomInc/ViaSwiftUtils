//
//  UIImageView+ActivityIndicator.swift
//  Hue
//
//  Created by mborace on 03/09/15.
//  Copyright (c) 2015 Viacom. All rights reserved.
//

import Foundation

private let rotationAnimationKey = "SpinAnimation"

public extension UIImageView {
    
    enum AnimationDuration {
        case Slow
        case Normal
        case Fast
        case Custom(time: NSTimeInterval)
        
        private var duration: NSTimeInterval {
            switch self {
            case .Slow:
                return 2.0
            case .Normal:
                return 2.0
            case .Fast:
                return 2.0
            case .Custom(let time):
                return time
            }
        }
    }
    
    
    final var isRotating: Bool {
        get {
            return self.layer.animationForKey(rotationAnimationKey) != nil
        }
    }
    
    
    ///  Starts animating the image like an activityIndicator.
    ///
    final func startRotating(duration: NSTimeInterval = AnimationDuration.Normal.duration) {
        self.layer.removeAllAnimations()
        self.hidden = false
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(2*M_PI)
        animation.duration = duration
        animation.repeatCount = HUGE
        self.layer.addAnimation(animation, forKey: rotationAnimationKey)
    }
    
    
    /// Stops rotating the image
    final func stopRotating() {
        self.layer.removeAllAnimations()
        self.hidden = true
    }
    
    /// makes the image of UIImageView AlwaysTemplate and sets the tintColor provided
    /// - parameter color: color that is set as a tintColor of the templated image
    final func colorize(color: UIColor) {
        if let image = self.image {
            self.image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.tintColor = color
        }
    }
}
