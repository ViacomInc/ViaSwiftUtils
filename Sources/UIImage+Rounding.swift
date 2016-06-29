//
//  UIImageView+Rounding.swift
//  PlayPlex
//
//  Created by Maximilian Clarke on 23/03/2016.
//  Copyright © 2016 Viacom. All rights reserved.
//

import UIKit

public extension UIImage {
    
    func cornersRounded(usingRadius radius: CGFloat) -> UIImage? {
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
