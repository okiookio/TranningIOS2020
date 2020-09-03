//
//  ExtensionInt.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

extension Int {
    static func random(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }
}
