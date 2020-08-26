//
//  HBDatePickerTextField.swift
//  HomeBooking
//
//  Created by helIgate on 8/26/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
import SwiftDate

class HBDatePickerTextField: HBTextField {
    @IBInspectable
    var dateFormat: String = "yyyy/MM/dd" {
        didSet {
            text = date?.toFormat(dateFormat)
        }
    }

    var didChangeDate: (() -> Void)?

    var date: Date? {
        didSet {
            text = date?.toFormat(dateFormat)
        }
    }

    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.calendar = Calendar(identifier: .gregorian)
        datePicker.addTarget(self, action: #selector(self.handleDatePicker(_:)), for: .valueChanged)
        return datePicker
    }()

    private func configDatePicker() {
        self.inputView = datePicker
    }

    @objc private func handleDatePicker(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        date = selectedDate
        didChangeDate?()
    }

    override func configStyle() {
        configDatePicker()
        padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        delegate = self
    }
}

extension HBDatePickerTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        date = nil
        didChangeDate?()
        return true
    }
}
