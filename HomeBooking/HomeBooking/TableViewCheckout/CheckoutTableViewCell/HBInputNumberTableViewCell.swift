//
//  HBInputNumberTableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBInputNumberTableViewCell: UITableViewCell {

    @IBOutlet weak var textFieldInputNumber: HBPaddingTextField!
    var didEndEditAction: ((String) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textFieldInputNumber.delegate = self
        textFieldInputNumber.layer.cornerRadius = 10
        textFieldInputNumber.padding = .init(top: 0, left: 16, bottom: 0, right: 16)
    }

    func bindPlaceholder(_ placeholder: String) {
        textFieldInputNumber.placeholder = placeholder
        textFieldInputNumber.setPlaceHolderColor(UIColor.gray)
    }

    func bindData(_ text: Any?) {

        textFieldInputNumber.text = text as? String


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    let maxInput = 10
}

extension HBInputNumberTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


        //input
        // vi tri cua input
        // text vua input
        // text truoc khi input
        // -> text hoan chinh
        // lay do dai cua text hoan chinh so sanh max

        // out : text co do dai <= 10

        //output -? ket qua || hanh dong de thuc hien bien doi input


        let currentString: NSString = (textField.text ?? "") as NSString
        // currentString = 12341234
        // string = 1234
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        // newString = 123412341234

        // kiem tra newString co phai khong va khac empty
        let str = newString as String
        print("str \(str)")

        return str.isNumber() || str.isEmpty
//        return newString.length <= maxInput
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldInputNumber.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditAction?(textFieldInputNumber.text ?? "")
    }
}

extension HBInputNumberTableViewCell: Reusable {}
