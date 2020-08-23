//
//  Checkout1TableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/23/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class Checkout1TableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!

    var didEndEditAction: ((String) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.delegate = self
        textField.layer.cornerRadius = 10
        textField.layer.opacity = 0.3

    }

    func bindPlaceholder(_ title: String) {
        textField.placeholder = title
    }

    func bindData(_ text: Any?) {

        textField.text = text as? String


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
