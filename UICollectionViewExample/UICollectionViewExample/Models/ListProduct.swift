//
//  CategoryProduct.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

struct ListProduct {
    var templates: String?
    var product: String?
    var food: String?
    var thankyou: String?
}
extension ListProduct {
    
    func displaytemplates() -> [ProductItem] {
        return ProductItem.genericRamdom(count: 10)
    }

    func displayProduct() -> [ProductItem] {
        return ProductItem.genericRamdom(count: 10)
    }
    
    func displayFood() -> [ProductItem] {
        return ProductItem.genericRamdom(count: 10)
    }
    
    func displayThankYou() -> [ProductItem] {
        return ProductItem.genericRamdom(count: 10)
    }
}
