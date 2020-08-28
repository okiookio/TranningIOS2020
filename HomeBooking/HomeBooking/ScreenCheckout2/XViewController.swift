//
//  XViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/26/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
import SwiftDate

class XViewController: UIViewController {
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expiryLabel: UILabel!
    @IBOutlet weak var cardNumberTextField: HBNumberTextField!
    @IBOutlet weak var expiryTextField: HBDatePickerTextField!
    @IBOutlet weak var cvvTextField: HBNumberTextField!
    @IBOutlet weak var nameTextField: HBPaddingTextField!
    @IBOutlet weak var saveCardButton: UIButton!
    @IBOutlet weak var goToConfirmationButton: UIButton!

    private let userDefault = HBUserdefault.shared

    private var data: HBCheckout2 = HBCheckout2() {
        didSet {
            if self.view != nil {
                updateUI(with: data)
            }
        }
    }

    var completeWithVisaCard: ((HBCheckout2) -> Void)?
    func setData(_ data: HBCheckout2) {
        self.data = data
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        updateUI(with: data)
    }

    func configUI() {
        let data = HBUserdefault.shared.getObjectData(forKey: "saveDataCheckout2", type: HBCheckout2.self)
        if let _ = data {
            self.saveCardButton.isSelected = true
        } else {
            self.saveCardButton.isSelected = false
        }

        cardNumberTextField.limitCharacter = 16
        cvvTextField.limitCharacter = 3

        nameTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingDidEnd)
        cardNumberTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingChanged)
        cardNumberTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingDidEnd)
        expiryTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingChanged)
        expiryTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingDidEnd)
        cvvTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingChanged)
        cvvTextField.addTarget(self, action: #selector(handleUpdateOf(_:)), for: .editingDidEnd)
    }

    @objc func handleUpdateOf(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            self.data.name = textField.text
        case cardNumberTextField:
            self.data.cardNumber = textField.text
        case expiryTextField:
            self.data.expiry = textField.text
        case cvvTextField:
            self.data.cvv = textField.text
        default:
            break
        }
    }

    private func updateUI(with data: HBCheckout2) {
        cardNumberLabel.text = data.displayCardNumber()
        nameLabel.text = data.displayName()?.uppercased()
        expiryLabel.text = data.displayExpiry()
        if let cardNumber = data.cardNumber, let number = Int(cardNumber) {
            cardNumberTextField.number = number
        } else {
            cardNumberTextField.number = nil
        }

        if let name = data.name {
            nameTextField.text = name
        } else {
            nameTextField.text = nil
        }

        if let date = data.expiry?.toDate(expiryTextField.dateFormat, region: Region.UTC)?.date {
            expiryTextField.date = date
        } else {
            expiryTextField.date = nil
        }
        if let cvv = data.cvv, let cvvNumber = Int(cvv) {
            cvvTextField.number = cvvNumber
        } else {
            cvvTextField.number = nil
        }
    }

    func getData() -> HBCheckout2? {
        guard data.isVisa else { return nil }
        return data
    }

    @IBAction func didTouchGoToConfirm(_ sender: Any) {
        guard let data = getData() else { return }
        self.completeWithVisaCard?(data)
        navigationController?.popViewController(animated: true)
    }

    @IBAction func didTouchSaveCardInfo(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        button.isSelected = !button.isSelected

        if button.isSelected {
            userDefault.setObjectData(data, forKey: "saveDataCheckout2")
        }else{
            userDefault.removeKey("saveDataCheckout2")
        }

    }
}

