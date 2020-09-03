//
//  ExtensionString.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

extension String {
    static func random(_ n: Int) -> String
    {
        let digits = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        var result = ""

        for _ in 0..<n {
            result += String(digits.randomElement()!)
        }

        return result
    }
}
