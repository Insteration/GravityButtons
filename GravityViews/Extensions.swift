//
//  Extensions.swift
//  GravityViews
//
//  Created by Art Karma on 4/23/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}
