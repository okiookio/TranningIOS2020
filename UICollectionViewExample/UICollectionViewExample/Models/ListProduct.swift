//
//  CategoryProduct.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

struct ListProduct {
    var templates: [TemplateItem]?
    var products: [ProductItem]?
    var foodAndDrink: [FoodAndDrinkItem]?
    var thankYouGift: [ThankYouGiftItem]?
}

extension ListProduct {

    func displayTemplates() -> [TemplateItem]? {
        return templates
    }

    func displayProduct() -> [ProductItem]? {
        return products
    }

    func displayFoodAndDrink() -> [FoodAndDrinkItem]? {
        return foodAndDrink
    }

    func displayThankYouGift() -> [ThankYouGiftItem]? {
        return thankYouGift
    }
}

extension ListProduct {
    static func dummy() -> ListProduct {
        return ListProduct(templates: TemplateItem.genericRamdom(),
                           products: ProductItem.genericRamdom(),
                           foodAndDrink: FoodAndDrinkItem.genericRamdom(),
                           thankYouGift: ThankYouGiftItem.genericRamdom())
    }
}

