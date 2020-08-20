//
//  SampleData.swift
//  TBExample
//
//  Created by helIgate on 8/19/20.
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

extension Int {
    static func random(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }
}
