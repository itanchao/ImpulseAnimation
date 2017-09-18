//
//  ImpulseAnimationView.swift
//  ImpulseAnimation
//
//  Created by 谈超 on 2017/9/18.
//  Copyright © 2017年 谈超. All rights reserved.
//

import UIKit

class ImpulseAnimationView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 1.0
        alphaAnimation.toValue = 0.0
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform")
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        scaleAnimation.fromValue = CATransform3DScale(CATransform3DIdentity, 0, 0, 0)
        scaleAnimation.toValue = CATransform3DScale(CATransform3DIdentity, 1, 1, 0)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [alphaAnimation,scaleAnimation]
        animationGroup.duration = 5
        animationGroup.autoreverses = false
        animationGroup.repeatCount = HUGE
        
        let shape = CAShapeLayer()
        shape.frame = bounds
        shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.width > bounds.height ? bounds.height : bounds.width).cgPath
        shape.strokeColor = UIColor(colorLiteralRed: 16.0/255.0, green: 129.0/255.0, blue: 1, alpha: 0.25).cgColor
        shape.fillColor = UIColor(colorLiteralRed: 16.0/255.0, green: 129.0/255.0, blue: 1, alpha: 0.15).cgColor
        shape.opacity = 0
        shape.add(animationGroup, forKey: "animationGroup")
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = bounds
        replicatorLayer.instanceDelay = 1
        replicatorLayer.instanceCount = 3
        replicatorLayer.addSublayer(shape)
        
        layer.addSublayer(replicatorLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
