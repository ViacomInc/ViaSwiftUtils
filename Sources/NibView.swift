//
//  NibView.swift
//  Nickelodeon
//
//  Created by Patryk Grabowski on 11/05/16.
//  Copyright © 2016 Nick Mobile. All rights reserved.
//

import Foundation

// MARK: - NibView Class

/// This class is intended to be subclassed. If you provide an Xib-file inside the same Bundle the subclass
/// lives in, this class will automatically find the layout file, load subviews from the xib and connect to
/// the respective IBOutlets. The class is not intended to be used as is.
open class NibView: UIView {

    private var didEncode: Bool = false
    private let didEncodeKey = "didEncodeKey"

    /// Designated initializer for UIView instance that use the nib file
    ///
    /// - parameter coder: The instance of class NSCoder
    ///
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.didEncode = aDecoder.decodeBool(forKey: didEncodeKey)
        if didEncode == false {
            self.loadAssociatedNibView()
        }
    }

    /// Designated initializer for UIView instance that use the nib file
    ///
    /// - parameter frame: The frame of initialized instance
    ///
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadAssociatedNibView()
    }

    open override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        didEncode = true
        aCoder.encode(didEncode, forKey: didEncodeKey)
    }

}
