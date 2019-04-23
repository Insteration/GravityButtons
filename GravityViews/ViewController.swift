//
//  ViewController.swift
//  GravityButtons
//
//  Created by Artem Karmaz on 4/23/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var views = [UIView]()
    var animator: UIDynamicAnimator!
    
    var timer = Timer()
    
    fileprivate func createGravityViews() {

        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(dropViews), userInfo: nil, repeats: true)
       
    }
    
    @objc func dropViews() {
        
        for _ in 5...15 {
            let view = UIView()
            view.frame = CGRect(x: Int.random(in: 0...Int(self.view.frame.size.width)), y: Int.random(in: 0...Int(self.view.frame.size.height)), width: 20, height: 20)
            view.layer.cornerRadius = 0.5 * view.bounds.size.width
            view.backgroundColor = UIColor.random
            view.layer.borderColor = UIColor.random.cgColor
            view.layer.borderWidth = CGFloat(Int.random(in: 1...4))
            views.append(view)
        }
        
        for i in views {
            view.addSubview(i)
        }
        
        animator = UIDynamicAnimator(referenceView: self.view)
        let gravity = UIGravityBehavior(items: views)
        gravity.angle = CGFloat(Int.random(in: 0...100))
        gravity.magnitude = CGFloat(Float.random(in: 0.6...1))
        animator.addBehavior(gravity)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createGravityViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func clearViewButton(_ sender: UIBarButtonItem) {
        views = []
        self.view.subviews.forEach({ $0.removeFromSuperview() })
    }
}

