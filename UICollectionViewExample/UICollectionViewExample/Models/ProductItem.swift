//
//  ProductItem.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

protocol ProductItemProtocol {
    var id: Int? { get set }
    var thumbnail: String? { get set }
    var name: String? { get set }
    var description: String? { get set }
    var price: Int? { get set }

    init()
}
struct TemplateItem: ProductItemProtocol {
    var id: Int?
    var thumbnail: String?
    var name: String?
    var description: String?
    var price: Int?
    
    
}


struct ProductItem: ProductItemProtocol {
    var id: Int?
    var thumbnail: String?
    var name: String?
    var description: String?
    var price: Int?
}

struct FoodAndDrinkItem: ProductItemProtocol {
    var id: Int?
    var thumbnail: String?
    var name: String?
    var description: String?
    var price: Int?
}

struct ThankYouGiftItem: ProductItemProtocol {
    var id: Int?
    var thumbnail: String?
    var name: String?
    var description: String?
    var price: Int?
}

extension ProductItemProtocol {
    static func genericRamdom<T:ProductItemProtocol>(count: Int = 10) -> [T] {
        var arrayProduct: [T] = []
        for i in 0...count {
            var product = T.init()
            product.id = i
            product.name = String.random(10)
            product.description = String.random(50)
            product.price = Int.random(from: 1, to: 100000)
            arrayProduct.append(product)
        }
        return arrayProduct
    }
}

extension ProductItemProtocol {
    func displayThumnail() -> String? {
        return thumbnail
    }

    func displayName() -> String? {
        return name
    }

    func displayDescription() -> String? {
        return description
    }
    
    func displayPrice() -> String? {
//        return price
        //TODO: need update: Format number to currency
        return "10,000 JPY"
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

import UIKit
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
