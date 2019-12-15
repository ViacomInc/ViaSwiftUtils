//
//  UIImage+Color.swift
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

    /// Convenience initializer to create an image with a uniform color
    ///
    /// - parameter color:       The color of the image created
    /// - parameter size:        The size of the image created
    convenience init?(color: UIColor?, size: CGSize = CGSize(width: 1.0, height: 1.0)) {
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
