//
//  Filter.swift
//  HomeBooking
//
//  Created by helIgate on 8/21/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

enum HBHotelFilterType: Int, CaseIterable {
    case Hotel
    case Home

    var text: String {
        switch self {
        case .Home:
            return "Home"
        case .Hotel:
            return "Hotel"
        }
    }
}


struct HBFilter: Codable {
    var yourBudget: String?
    var startRating: Int?
    var reviewScore: Int?
    var meals: String?
    var breakfastIncluted: Bool?
    var deals: Bool?
    var onlyShowAvailable: Bool?
    var type: Int?

}
struct HBFilterTableViewCell {
    var nameCell: String?
    var typeCell: Int?
}

extension HBFilter {
    func displayType() -> String? {
        guard let type = type else { return nil }
        return HBHotelFilterType(rawValue: type)?.text
    }
    func displayYourBudget() -> String? {
        return yourBudget
    }
    func displayRating() -> String? {
        //neu starRating nil -> hien thi nil
        //ep kieu int ve string -> hien thi starRating
        guard let rating = startRating else { return nil }
        return String(rating)
    }
    func displayReviewScore() -> String? {
        guard let score = reviewScore else { return nil }
        return String(score)
    }
    func displayMeals() -> String? {
        return meals
    }
    func displayBreakfast() -> Bool? {
        return breakfastIncluted
    }
    func dispalyDeals() -> Bool? {
        return deals
    }
    func displayOnlyShowAvailable() -> Bool? {
        return onlyShowAvailable
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
    
    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isNumber() -> Bool {
        
        return Int(self) != nil
        
        // int la nil thi return false
        // con lai return true
    }
}

extension Int {
    static func random(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }
}
