//
//  HBCheckout2.swift
//  HomeBooking
//
//  Created by helIgate on 8/26/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

struct HBCheckout2: Codable {
    var cardNumber: String?
    var expiry: String?
    var cvv: String?
    var name: String?
}

extension HBCheckout2 {
    func displayCardNumber() -> String? {
        return cardNumber
    }
    func displayExpiry() -> String? {
        return expiry
    }
    func displayCVV() -> String? {
        return cvv
    }
    func displayName() -> String? {
        return name
    }

}
extension HBCheckout2 {
    var isVisa: Bool {
        guard let number = cardNumber, number.count > 0, number.count <= 16 else { return false }
        guard let ex = expiry, !ex.isEmpty else { return false }
        guard let c = cvv, c.count > 0, c.count <= 16 else { return false }
        guard let n = name, !n.isEmpty else { return false }
        return true
    }
}
