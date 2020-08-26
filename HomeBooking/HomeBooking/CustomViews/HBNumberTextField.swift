//
//  HBNumberTextField.swift
//  HomeBooking
//
//  Created by helIgate on 8/26/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBNumberTextField: HBTextField {
    var didChangeNumber: (() -> Void)?
    var limitCharacter: Int?
    
    var number : Int? {
        didSet {
            if let number = self.number {
                text = "\(number)"
            } else {
                text = nil
            }
        }
    }
    
    override func configStyle() {
        padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        delegate = self
        keyboardType = .numberPad
    }
}
extension HBNumberTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        let str = newString as String
        guard let limit = limitCharacter else { return str.isNumber() || str.isEmpty }
        return (str.isNumber() || str.isEmpty) && str.count <= limit
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        number = nil
        didChangeNumber?()
        return true
    }
}

