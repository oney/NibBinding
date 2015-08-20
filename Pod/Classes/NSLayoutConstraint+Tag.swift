//
//  NSLayoutConstraint+Tag.swift
//  Pods
//
//  Created by one on 2015/8/20.
//
//

import Foundation
import UIKit
import ObjectiveC

private var constraintTagAssociationKey: UInt8 = 0

extension NSLayoutConstraint {
    @IBInspectable var constraintTag: Int {
        get {
            var obj: AnyObject! = objc_getAssociatedObject(self, &constraintTagAssociationKey)
            if obj == nil {
                return 0
            }
            else {
                return obj as! Int
            }
        }
        set(newValue) {
            objc_setAssociatedObject(self, &constraintTagAssociationKey, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
        }
    }
}
