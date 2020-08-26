//
//  HBCheckout2ViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

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

    private var dataCheckout2: HBCheckout2? = HBCheckout2()
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

        expiryTextField.didChangeDate = { [weak self] in
            self?.expiryLabel.text = self?.expiryTextField.text
        }
        // lay

        cardNumberTextField.addTarget(self, action: #selector(bindDataCardnumberLabel(_:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(bindDataNameLabel(_:)), for: .editingChanged)

        bindData()
        expiryTextField.date = Date()
    }
    func setDataCheckout(_ data: HBCheckout2) {
        self.dataCheckout2 = data
    }

    func bindData() {
//        cardNumberTextField.text = dataCheckout2?.displayCardNumber()
        expiryTextField.text = dataCheckout2?.displayExpiry()
//        cvvTextField.text = dataCheckout2?.displayCVV()
//        nameTextField.text = dataCheckout2?.displayName()
//

    }


    @objc private func bindDataCardnumberLabel(_ textField: UITextField) {
        cardNumberLabel.text = textField.text
    }

    @objc private func bindDataNameLabel(_ textField: UITextField) {
        nameLabel.text = textField.text
    }

    @IBAction func didTounchGoToConfirmation(_ sender: Any) {
        guard let cardNumber = cardNumberTextField.text, !cardNumber.isEmpty,
            let expiryDate = expiryTextField.date,
            let cvvNumber = cvvTextField.text, !cvvNumber.isEmpty,
            let name = nameTextField.text, !name.isEmpty else { return }
//        let data = HBCheckout2(cardNumber: cardNumber, expiry: expiryDate, cvv: cvvNumber, name: name)
//        self.didTouchGoToConfirmation?(data)
        navigationController?.popViewController(animated: true)
    }

    @IBAction func didTouchSaveCardButton(_ sender: Any) {
        if let button = sender as? UIButton {
            saveCardButton.isSelected = !button.isSelected
        }
    }
}
