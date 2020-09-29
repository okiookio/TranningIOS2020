//
//  HBTabbarButton.swift
//  HomeBooking
//
//  Created by helIgate on 9/24/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBTabbarButton: UIButton {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        set {
            super.isSelected = newValue
        }
        get {
            return super.isSelected
        }
    }

}

extension Array where Element == HBTabbarButton {
    func select(at index: Int) {
        for i in 0..<self.count {
            self[i].isSelected = index == i
        }
    }
    func select(at button: HBTabbarButton) {
        for item in self {
            item.isSelected = button == item
        }
    }
}
