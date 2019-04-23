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
    
    
    fileprivate func createGravityViews() {
        for _ in 50...500 {
            let view = UIView()
            view.frame = CGRect(x: Int.random(in: 0...Int(self.view.frame.size.width)), y: Int.random(in: 0...Int(self.view.frame.size.height)), width: 20, height: 20)
            view.layer.cornerRadius = 0.5 * view.bounds.size.width
            view.backgroundColor = UIColor.random
            view.layer.borderColor = UIColor.random.cgColor
            view.layer.borderWidth = 2
            views.append(view)
        }
        
        for i in views {
            view.addSubview(i)
        }
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let gravity = UIGravityBehavior(items: views)
        gravity.magnitude = 1
        animator.addBehavior(gravity)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        createGravityViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addGravityViews(_ sender: UIBarButtonItem) {
        createGravityViews()
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
