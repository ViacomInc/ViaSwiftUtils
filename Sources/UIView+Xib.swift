//
//  UIView+Xib.swift
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

import Foundation

public extension UIView {

    class func loadFromNib(named nibName: String, bundle: Bundle? = nil, owner: AnyObject? = nil) -> UIView? {
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: owner, options: nil).first as? UIView
    }

    /// Find nib instance associated with view, name of UIView instance must be the same as name of UINib instance. The owner of nib's view is 'self'.
    internal func loadAssociatedNibView() {
        self.loadNibView(self)
    }
    
    /// Find nib instance associated with view, name of UIView instance must be the same as name of UINib instance.
    ///
    /// - parameter owner: The owner of nib's view
    internal func loadNibView(_ owner: AnyObject?) {
        let bundle = Bundle(for: type(of: self))
        UIView.loadFromNib(named: String(describing: type(of: self)), bundle: bundle, owner: owner).map {
            $0.frame = self.bounds
            self.addSubview($0)
        }
    }

}
