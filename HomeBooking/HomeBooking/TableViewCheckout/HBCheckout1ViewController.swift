//
//  HBCheckout1ViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/23/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBCheckout1ViewController: UIViewController {

    enum HBCheckoutField: Int, CaseIterable {
        case firstName
        case lastName
        case emailAddress
        case address
        case postCode
        case country
        case mobilePhone

        var getText: String {
            switch self {
            case .firstName:
                return "First Name"
            case .lastName:
                return "Last Name"
            case .emailAddress:
                return "Email Address"
            case .address:
                return "Address"
            case .postCode:
                return "Post Code"
            case .country:
                return "Country"
            case .mobilePhone:
                return "Mobile Phone"
            }
        }

    }

    @IBOutlet weak var goToPaymentButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    private var checkoutData = HBCheckoutModel()
    var updateCheckout: ((_ checkout: HBCheckoutModel) -> Void)?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupToHideKeyboardOnTapOnView()

        // Do any additional setup after loading the view.
//        tableView.register(UINib(nibName: "Checkout1TableViewCell", bundle: nil), forCellReuseIdentifier: "Checkout1TableViewCell")
//        tableView.register(UINib(nibName: "HBInputNumberTableViewCell", bundle: nil), forCellReuseIdentifier: "HBInputNumberTableViewCell")
//        tableView.registerCell(Checkout1TableViewCell.self)
//        tableView.registerCells([Checkout1TableViewCell.self,
//                                    HBInputNumberTableViewCell.self])
        tableView.registerCell(HBInputNumberTableViewCell.self)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        goToPaymentButton.layer.cornerRadius = 10
    }

    @IBAction func didTouchGoToPayment(_ sender: UIButton) {
        self.updateCheckout?(checkoutData)
        navigationController?.popViewController(animated: true)
    }

    func bindDataCheckout(_ data: HBCheckoutModel) {
        self.checkoutData = data
    }

}

extension HBCheckout1ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HBCheckoutField.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let row = HBCheckoutField(rawValue: indexPath.row) else { return UITableViewCell() }
        switch row {
        case .firstName:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout1TableViewCell", for: indexPath) as! Checkout1TableViewCell
            cell.bindPlaceholder(HBCheckoutField.firstName.getText)
            cell.bindData(self.checkoutData.fistName)
            cell.didEndEditAction = { [weak self] (text) in
                if text.isEmpty {
                    cell.textField.layer.borderWidth = 1.0
                    cell.textField.layer.borderColor = UIColor.red.cgColor
                } else {
                    cell.textField.layer.borderWidth = 0.0
                    self?.checkoutData.fistName = text
                }
            }
            return cell
        case .lastName:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout1TableViewCell", for: indexPath) as! Checkout1TableViewCell
            cell.bindPlaceholder(HBCheckoutField.lastName.getText)
            cell.bindData(self.checkoutData.lastName)
            cell.didEndEditAction = { [weak self] (text) in
                self?.checkoutData.lastName = text

            }
            return cell
        case .emailAddress:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout1TableViewCell", for: indexPath) as! Checkout1TableViewCell
            cell.bindPlaceholder(HBCheckoutField.emailAddress.getText)
            cell.bindData(self.checkoutData.emailAddress)
            cell.didEndEditAction = { [weak self] (text) in
                if text.isEmail() {
                    self?.checkoutData.emailAddress = text
                } else {
                    print("\(text) is not email")
                }
            }
            cell.textField.keyboardType = .emailAddress
            return cell
        case .address:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout1TableViewCell", for: indexPath) as! Checkout1TableViewCell
            cell.bindPlaceholder(HBCheckoutField.address.getText)
            cell.bindData(self.checkoutData.address)
            cell.didEndEditAction = { [weak self] (text) in
                self?.checkoutData.address = text
            }
            return cell
        case .postCode:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout1TableViewCell", for: indexPath) as! Checkout1TableViewCell
            cell.bindPlaceholder(HBCheckoutField.postCode.getText)
            cell.bindData(self.checkoutData.postCode)
            cell.didEndEditAction = { [weak self] (text) in
                self?.checkoutData.postCode = text
            }
            cell.textField.keyboardType = .numberPad
            return cell
        case .country:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Checkout1TableViewCell", for: indexPath) as! Checkout1TableViewCell
            cell.bindPlaceholder(HBCheckoutField.country.getText)
            cell.bindData(self.checkoutData.country)
            cell.didEndEditAction = { [weak self] (text) in
                self?.checkoutData.country = text
            }
            return cell
        case .mobilePhone:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HBInputNumberTableViewCell", for: indexPath) as! HBInputNumberTableViewCell
            cell.bindPlaceholder(HBCheckoutField.mobilePhone.getText)
            cell.bindData(self.checkoutData.mobile)
            cell.didEndEditAction = { [weak self] (text) in
                self?.checkoutData.mobile = text
            }
            cell.textFieldInputNumber.keyboardType = .phonePad
            return cell
        }
    }


}

extension HBCheckout1ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)

    }
}

extension UIViewController
{
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
