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
            product.thumbnail = "https://image.shutterstock.com/image-photo/white-transparent-leaf-on-mirror-260nw-577160911.jpg"
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
        //TODO: need update: Format number to currency
        guard let priceNumber = price else { return "0.00 JPY" }
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        guard let formattedPrice = formatter.string(from: priceNumber as NSNumber) else {
            return "0.00 JPY"
        }
        return "\(formattedPrice) JPY"
    }
}
