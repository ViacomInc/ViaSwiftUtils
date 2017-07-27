//
//  NibView.swift
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

// MARK: - NibView Class

/// This class is intended to be subclassed. If you provide a Xib-file inside the same Bundle the subclass
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

    /// Designated initializer for UIView instance that uses the nib file
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
