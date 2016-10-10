//
//  UIImage+Color.swift
//  Nickelodeon
//
//  Created by Patryk Grabowski on 10/05/16.
//  Copyright © 2016 Nick Mobile. All rights reserved.
//

import Foundation

extension UIImage {

    /// convenience initializer to set image from color
    ///
    /// - parameter color:       color of image
    /// - parameter size:        size of image
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
