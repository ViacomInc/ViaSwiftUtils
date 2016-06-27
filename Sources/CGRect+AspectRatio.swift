//
//  CGRect+AspectRatio.swift
//  PlayPlex
//
//  Created by Konrad Feiler on 12/05/16.
//  Copyright © 2016 Viacom. All rights reserved.
//

import Foundation

public extension CGRect {
    
    ///aspect ratio of the rect, i.e. width/height. For a height of 0 the aspect ratio is 0
    var aspectRatio: CGFloat {
        guard self.height > 0 else { return 0 }
        return self.width/self.height
    }
    
    /// linear combination of the receiver with otherRect
    /// - parameter otherRect: The other rect to which linearly combine the receiver
    /// - parameter value: linear factor, clamped to [0,1]
    func linearCombinedWith(otherRect: CGRect, by value: CGFloat) -> CGRect {
        let minMaxValue = min(1.0, max(0.0, value))
        
        return CGRect(x: (1-minMaxValue) * self.origin.x + minMaxValue * otherRect.origin.x,
                      y: (1-minMaxValue) * self.origin.y + minMaxValue * otherRect.origin.y,
                      width: (1-minMaxValue) * self.size.width + minMaxValue * otherRect.size.width,
                      height: (1-minMaxValue) * self.size.height + minMaxValue * otherRect.size.height)
    }
}
