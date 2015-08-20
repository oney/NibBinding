//
//  NibBinding.swift
//  Pods
//
//  Created by one on 2015/8/20.
//
//

import Foundation
import UIKit
import ObjectiveC

public class NibBinding {
    var allViews: [Int: UIView] = [:]
    var layoutConstraintCollection: [Int: NSLayoutConstraint] = [:]
    
    public init(allViews: [Int: UIView]) {
        self.allViews = allViews
    }
    
    public class func bind(nibName: String, views: [Int: UIView]) -> [Int: NSLayoutConstraint] {
        var root: UIView = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)[0] as! UIView
        var nibBinding = NibBinding(allViews: views)
        nibBinding.iterateView(root)
        return nibBinding.layoutConstraintCollection
    }
    
    func iterateView(superview: UIView) {
        var realSuperview = allViews[superview.tag]
        for subview in superview.subviews {
            var realSubview = allViews[subview.tag]
            realSuperview?.addSubview(realSubview!)
            realSubview?.setTranslatesAutoresizingMaskIntoConstraints(false)
        }
        linkConstraint(superview)
        for subview in superview.subviews {
            iterateView(subview as! UIView)
        }
    }
    
    func linkConstraint(superview: UIView) {
        var realSuperview = allViews[superview.tag]
        var constraints = superview.constraints()
        for c in constraints {
            var constraint: NSLayoutConstraint! = c as! NSLayoutConstraint
            
            var constraintFirstItem: UIView = constraint.firstItem as! UIView
            var constraintSecondItem: UIView? = constraint.secondItem as? UIView
            var firstItem = allViews[constraintFirstItem.tag]
            var secondItem: UIView?
            if constraintSecondItem != nil {
                var tag: Int = constraintSecondItem!.tag
                secondItem = allViews[tag]
            }
            
            var realConstraint = NSLayoutConstraint(item: firstItem!, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: secondItem, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant)
            if constraint.constraintTag != 0 {
                layoutConstraintCollection[constraint.constraintTag] = realConstraint
            }
            
            realSuperview?.addConstraint(realConstraint)
        }
    }
}