//
//  ExtensionUIColor.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
