//
//  UIPaddingTextField.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
// 

import UIKit

class UIPaddingTextField: UITextField {

    var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
