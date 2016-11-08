//
//  UIView+Xib.swift
//  Nickelodeon
//
//  Created by Sebastian Jędruszkiewicz on 08/01/16.
//  Copyright © 2016 Nick Mobile. All rights reserved.
//

import Foundation


extension UIView {

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
