//
//  CGRect+AspectRatio.swift
//  PlayPlex
//
//  Created by Konrad Feiler on 12/05/16.
//  Copyright © 2016 Viacom. All rights reserved.
//

import Foundation

public extension CGRect {
    var aspectRatio: CGFloat {
        guard self.height > 0 else { return 0 }
        return self.width/self.height
    }
    
    func linearCombinedWith(otherRect: CGRect, by value: CGFloat) -> CGRect {
        return CGRect(x: (1-value) * self.origin.x + value * otherRect.origin.x,
                      y: (1-value) * self.origin.y + value * otherRect.origin.y,
                      width: (1-value) * self.size.width + value * otherRect.size.width,
                      height: (1-value) * self.size.height + value * otherRect.size.height)
    }
}
