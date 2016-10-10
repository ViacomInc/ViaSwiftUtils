//
//  UIView+Xib.swift
//  Nickelodeon
//
//  Created by Sebastian Jędruszkiewicz on 08/01/16.
//  Copyright © 2016 Nick Mobile. All rights reserved.
//

import Foundation


extension UIView {
    class func loadFromNibNamed(_ nibName: String, bundle: Bundle? = nil, owner: AnyObject? = nil) -> UIView? {
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: owner, options: nil).first as? UIView
    }
    
    public func awakeAfterUsingCoder(_ aDecoder: NSCoder, nibName: String) -> AnyObject? {
        if self.subviews.isEmpty {
            let nib = UINib(nibName: nibName, bundle: nil)
            guard let loadedView = nib.instantiate(withOwner: nil, options: nil).first as? UIView else {
                print("WARNING, no View found in nib for nibName \(nibName)")
                return self
            }
            
            /// set view as placeholder is set
            loadedView.frame = self.frame
            loadedView.autoresizingMask = self.autoresizingMask
            loadedView.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints
            
            for constraint in self.constraints {
                var firstItem = constraint.firstItem as? UIView
                if firstItem == self {
                    firstItem = loadedView
                }
                
                if var secondItem = constraint.secondItem as? UIView? {
                    if secondItem == self {
                        secondItem = loadedView
                    }
                 
                    if let firstItem = firstItem {
                        loadedView.addConstraint(NSLayoutConstraint(item: firstItem,
                            attribute: constraint.firstAttribute,
                            relatedBy: constraint.relation, toItem: secondItem, attribute: constraint.secondAttribute,
                            multiplier: constraint.multiplier, constant: constraint.constant))
                    }
                }
            }
            
            return loadedView
        }
        
        return self
    }
    
    /// Find nib instance associated with view, name of UIView instance must be same as name of UINib instance. The owner of nib's view is 'self'.
    public func loadAssociatedNibView() {
        self.loadNibView(self)
    }
    
    /// Find nib instance associated with view, name of UIView instance must be same as name of UINib instance.
    ///
    /// - parameter owner: owner of nib's view
    public func loadNibView(_ owner: AnyObject?) {
        let bundle = Bundle(for: type(of: self))
        UIView.loadFromNibNamed(String(describing: type(of: self)), bundle: bundle, owner: owner).map {
            $0.frame = self.bounds
            self.addSubview($0)
        }
    }

}
