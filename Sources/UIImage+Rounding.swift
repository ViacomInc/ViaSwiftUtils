//
//  UIImageView+Rounding.swift
//  PlayPlex
//
//  Created by Maximilian Clarke on 23/03/2016.
//  Copyright © 2016 Viacom. All rights reserved.
//

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

        CGContextAddPath(context, UIBezierPath(roundedRect: rect, cornerRadius: radius).CGPath)
        CGContextClip(context)
        
        self.drawInRect(rect)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return output
    }
}
