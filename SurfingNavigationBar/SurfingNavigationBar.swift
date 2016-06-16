//
//  SurfingNavigationBar.swift
//  SurfingNavigationBarDemo
//
//  Created by chenpeiwei on 6/15/16.
//  Copyright © 2016 chenpeiwei. All rights reserved.
//

import UIKit

extension UINavigationBar {
    private struct overlayViewKeys {
        static var DescriptiveName = "surfing_navigation_bar_overlay"
    }
    
    var overlayView: UIView? {
        get {
            return objc_getAssociatedObject(self, &overlayViewKeys.DescriptiveName) as? UIView
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &overlayViewKeys.DescriptiveName,
                    newValue as UIView?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    func surfing_setBackgroundColor(backgroundColor:UIColor) {
        self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        if let overlayView = self.overlayView {
            if !overlayView.isDescendantOfView(self) {
                self.insertSubview(overlayView, atIndex: 0)
            }
        } else {
            self.overlayView = UIView(frame: CGRect(x: 0, y: -20, width: CGRectGetWidth(self.bounds), height: CGRectGetHeight(self.bounds)+20))
            self.overlayView?.userInteractionEnabled = false
            self.overlayView?.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
            self.insertSubview(self.overlayView!, atIndex: 0)
        }
        self.overlayView?.backgroundColor = backgroundColor
    }
    
    func surfing_setTranslationY(translationY:CGFloat) {
        self.transform = CGAffineTransformMakeTranslation(0, translationY)
    }
    
    func surfing_setElementsAlpha(alpha:CGFloat) {
        self.valueForKey("_leftViews")?.enumerateObjectsUsingBlock({ (view, index, stop) in
            (view as! UIView).alpha = alpha
        })
        self.valueForKey("_rightViews")?.enumerateObjectsUsingBlock({ (view, index, stop) in
            (view as! UIView).alpha = alpha
        })
        
        let titleView = self.valueForKey("_titleView") as? UIView
        titleView?.alpha = alpha
        
        for (_,subview) in self.subviews.enumerate() {
            guard let UINavigationItemViewClass = NSClassFromString("UINavigationItemView") else{
                return
            }
            if subview.isKindOfClass(UINavigationItemViewClass) {
                subview.alpha = alpha
                break
            }
        }
        
    }
    
    func surfing_reset() {
        self.setBackgroundImage(nil, forBarMetrics: .Default)
        self.overlayView?.removeFromSuperview()
    }
    
}
