//
//  ViewController.swift
//  ImpulseAnimation
//
//  Created by 谈超 on 2017/9/17.
//  Copyright © 2017年 谈超. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView = ImpulseAnimationView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 120, height: 200)))
        animationView.center = view.center
        view.addSubview(animationView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

