//
//  ProductItem.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

struct ProductItem {
    var id: Int?
    var thumbnail: Int?
    var name: String?
    var description: String?
    var price: Double?
}
extension ProductItem {
    static func genericRamdom(count: Int = 100) -> [ProductItem] {
        var arrayProduct = [ProductItem]()
        for i in 0...count {
            var product = ProductItem(id: i)
            product.name = String.random(10)
            product.description = String.random(50)
            product.price = Double(Int.random(from: 1, to: 100000))
            arrayProduct.append(product)
        }
        return arrayProduct
    }
}

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
