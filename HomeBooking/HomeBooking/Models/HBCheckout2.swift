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
    var expiry : Date?
    var cvv : String?
    var name : String?
}
extension HBCheckout2 {
    func displayCardNumber() -> String? {
        return cardNumber
    }
    func displayExpiry() -> String? {
        guard let date = expiry else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-yyyy"
        return dateFormatter.string(from: date)
    }
    func displayCVV() -> String? {
        return cvv
    }
    func displayName() -> String? {
        return name
    }
    
}
