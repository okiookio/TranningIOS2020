//
//  Checkout1TableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/23/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit


class Checkout1TableViewCell: UITableViewCell {
    @IBOutlet weak var textField: HBPaddingTextField!

    var didEndEditAction: ((String) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.delegate = self
        textField.layer.cornerRadius = 10

        textField.padding = .init(top: 0, left: 16, bottom: 0, right: 16)

    }

    func bindPlaceholder(_ placeholder: String) {
        
        textField.placeholder = placeholder
        textField.setPlaceHolderColor(UIColor.gray)

        //placeholder co mau
    }

    func bindData(_ text: Any?) {

        textField.text = text as? String


    }

}

extension Checkout1TableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditAction?(textField.text ?? "")
    }
}

extension UITextField {
    func setPlaceHolderColor(_ color: UIColor) {
        guard let placeholder = self.placeholder,
            let font = self.font else { return }
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font]
        let attributedString = NSAttributedString(string: placeholder, attributes: attributes)
        self.attributedPlaceholder = attributedString
    }
}

extension Checkout1TableViewCell: Reusable {}
