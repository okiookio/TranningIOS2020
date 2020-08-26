//
//  HBCheckout2.swift
//  HomeBooking
//
//  Created by helIgate on 8/26/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

struct HBCheckout2 {
    var cardNumber : String?
    var expiry : String?
    var cvv : String?
    var name : String?
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
