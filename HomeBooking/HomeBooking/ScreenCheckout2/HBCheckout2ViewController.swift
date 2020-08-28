//
//  HBCheckout2ViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
import SwiftDate

class HBCheckout2ViewController: UIViewController {

    @IBOutlet weak var cardNumberTextField: HBNumberTextField!
    @IBOutlet weak var expiryTextField: HBDatePickerTextField!
    @IBOutlet weak var cvvTextField: HBNumberTextField!
    @IBOutlet weak var nameTextField: HBPaddingTextField!
    @IBOutlet weak var saveCardButton: UIButton!
    @IBOutlet weak var goToConfirmationButton: UIButton!

    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expiryLabel: UILabel!

    private var dataCheckout2: HBCheckout2 = HBCheckout2() {
        didSet {
            if self.view != nil {
                setUIData(dataCheckout2)
            }
        }
    }
    func setDataCheckout(_ data: HBCheckout2) {
        self.dataCheckout2 = data
    }
    var didTouchGoToConfirmation: ((_ data: HBCheckout2) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        cardNumberTextField.layer.cornerRadius = 10
        expiryTextField.layer.cornerRadius = 10
        cvvTextField.layer.cornerRadius = 10
        nameTextField.layer.cornerRadius = 10
        goToConfirmationButton.layer.cornerRadius = 10

        cardNumberTextField.limitCharacter = 16
        cvvTextField.limitCharacter = 3
        nameTextField.maxString = 16

        cardNumberTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingChanged)
        cardNumberTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingDidEnd)

        nameTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingDidEnd)

        cvvTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingChanged)
        cvvTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingDidEnd)

        expiryTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingChanged)
        expiryTextField.addTarget(self, action: #selector(updateDataHandle(_:)), for: .editingDidEnd)

        let data = HBUserdefault.shared.getObjectData(forKey: "saveDataCheckout2", type: HBCheckout2.self)
        if let _ = data {
            self.saveCardButton.isSelected = true
        } else {
            self.saveCardButton.isSelected = false
        }

        setUIData(dataCheckout2)

    }
    @objc private func updateDataHandle(_ textField: UITextField) {
        switch textField {
        case cardNumberTextField:
            self.dataCheckout2.cardNumber = textField.text
        case expiryTextField:
            self.dataCheckout2.expiry = textField.text
        case cvvTextField:
            self.dataCheckout2.cvv = textField.text
        case nameTextField:
            self.dataCheckout2.name = textField.text
        default:
            break
        }
    }

    private func setUIData(_ data: HBCheckout2) {
        cardNumberLabel.text = data.displayCardNumber()
        expiryLabel.text = data.displayExpiry()
        nameLabel.text = data.displayName()?.uppercased()

        if let cardNumber = data.cardNumber, let number = Int(cardNumber) {
            cardNumberTextField.number = number
        } else {
            cardNumberTextField.number = nil
        }
        if let expiry = data.expiry?.toDate(expiryTextField.dateFormat, region: .UTC)?.date {
            expiryTextField.date = expiry
        } else {
            expiryTextField.date = nil
        }
        if let name = data.name {
            nameTextField.text = name
        } else {
            nameTextField.text = nil
        }
        if let cvvNumber = data.cvv, let cvv = Int(cvvNumber) {
            cvvTextField.number = cvv
        } else {
            cvvTextField.number = nil
        }
    }




    private func getData() -> HBCheckout2? {
        guard dataCheckout2.isVisa else { return nil }
        return dataCheckout2
    }

    @IBAction private func didTounchGoToConfirmation(_ sender: Any) {
        guard let data = getData() else { return }
        self.didTouchGoToConfirmation?(data)
        saveCard(saveCardButton)
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func didTouchSaveCardButton(_ sender: Any) {
        if let button = sender as? UIButton {
            saveCardButton.isSelected = !button.isSelected
            saveCard(button)
        }
    }
    private func saveCard(_ button: UIButton) {
        let userDefault = HBUserdefault.shared
        if button.isSelected {
            userDefault.setObjectData(dataCheckout2, forKey: "saveDataCheckout2")
        } else {
            userDefault.removeKey("saveDataCheckout2")
        }
    }
}
