//
//  UIPaddingTextField.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
// 

import UIKit

class HBPaddingTextField: HBTextField {
    var maxString : Int?
    
    override func configStyle() {
        padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension HBPaddingTextField : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        let str = newString as String
        guard let max = maxString else { return true }
        return str.count <= max
    }
}



