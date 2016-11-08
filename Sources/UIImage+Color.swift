//
//  UIImage+Color.swift
//  Nickelodeon
//
//  Created by Patryk Grabowski on 10/05/16.
//  Copyright © 2016 Nick Mobile. All rights reserved.
//

import Foundation

extension UIImage {

    /// Convenience initializer to create an image with a uniform color
    ///
    /// - parameter color:       The color of the image created
    /// - parameter size:        The size of the image created
    public convenience init?(color: UIColor?, size: CGSize = CGSize(width: 1.0, height: 1.0)) {
        defer {
            UIGraphicsEndImageContext()
        }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color?.setFill()
        UIRectFill(rect)
        UIGraphicsGetImageFromCurrentImageContext()
        guard let imageRef = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }
        self.init(cgImage: imageRef)
    }
    
}
