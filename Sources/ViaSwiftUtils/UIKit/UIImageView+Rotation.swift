//
//  UIImageView+ActivityIndicator.swift
//  ViaSwiftUtils
//
//  Copyright 2017 Viacom, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import UIKit

enum RotationAnimation {
    static let key = "ViaSwiftUtils.SpinAnimation"
}

public extension UIView {
    
    enum AnimationDuration {
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
        return layer.animation(forKey: RotationAnimation.key) != nil
    }
    
    ///  Starts animating the image like an activityIndicator.
    /// - parameter duration: an NSTimeInterval duration the animation should take
    final func startRotating(_ animationDuration: AnimationDuration = .normal, isRemovedOnCompletion: Bool = true) {
        layer.removeAnimation(forKey: RotationAnimation.key)
        isHidden = false
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = 2 * CGFloat.pi
        animation.duration = animationDuration.duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = isRemovedOnCompletion
        layer.add(animation, forKey: RotationAnimation.key)
    }
    
    /// Stops rotating the image
    final func stopRotating() {
        layer.removeAnimation(forKey: RotationAnimation.key)
        isHidden = true
    }
}

public extension UIImageView {

    /// makes the image of UIImageView AlwaysTemplate and sets the tintColor provided
    /// - parameter color: color that is set as a tintColor of the templated image
    final func colorize(_ color: UIColor) {
        if let image = self.image {
            self.image = image.withRenderingMode(.alwaysTemplate)
            tintColor = color
        }
    }
}
