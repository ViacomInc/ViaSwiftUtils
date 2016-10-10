//
//  NibView.swift
//  Nickelodeon
//
//  Created by Patryk Grabowski on 11/05/16.
//  Copyright © 2016 Nick Mobile. All rights reserved.
//

import Foundation


//MARK: - NibView Class

open class NibView: UIView {

    /// designed initializer for UIView instance that use nib file
    ///
    /// - parameter coder: instance of class NSCoder
    ///
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadAssociatedNibView()
    }

    /// designed initializer for UIView instance that use nib file
    ///
    /// - parameter frame: frame of initialized instance
    ///
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadAssociatedNibView()
    }
    
}
