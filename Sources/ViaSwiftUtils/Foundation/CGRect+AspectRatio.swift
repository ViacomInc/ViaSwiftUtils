//
//  CGRect+AspectRatio.swift
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

#if os(OSX) || os(iOS)
    import CoreGraphics
#endif
import Foundation

public extension CGRect {
    
    ///aspect ratio of the rect, i.e. width/height. For a height of 0 the aspect ratio is 0
    var aspectRatio: CGFloat {
        guard self.size.height > 0 else { return 0 }
        return self.size.width / self.size.height
    }
    
    /// linear combination of the receiver with otherRect
    /// - parameter otherRect: The other rect to which linearly combine the receiver
    /// - parameter value: linear factor, clamped to [0,1]
    /// - returns: A new CGRect that represents the linear combination
    func linearCombined(with otherRect: CGRect, by value: CGFloat) -> CGRect {
        let minMaxValue = min(1.0, max(0.0, value))
        let x = (1 - minMaxValue) * self.origin.x + minMaxValue * otherRect.origin.x
        let y = (1 - minMaxValue) * self.origin.y + minMaxValue * otherRect.origin.y
        let width = (1 - minMaxValue) * self.size.width + minMaxValue * otherRect.size.width
        let height = (1 - minMaxValue) * self.size.height + minMaxValue * otherRect.size.height
        
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
    }
}
