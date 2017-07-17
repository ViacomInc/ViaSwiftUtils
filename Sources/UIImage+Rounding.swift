//
//  UIImageView+Rounding.swift
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

public extension UIImage {
    
    /// returns a rounded corner image, rerendered using the receiver
    /// - parameter radius: the radius of the rounded corners
    /// - returns: the image created by the method
    final func cornersRounded(usingRadius radius: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        guard let context = UIGraphicsGetCurrentContext() else {
            print("WARNING: Failed to get current Graphics context")
            return nil
        }
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        context.addPath(UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath)
        context.clip()
        
        self.draw(in: rect)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return output
    }
}
