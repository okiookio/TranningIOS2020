//
//  UserPresenter.swift
//  MVPExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

protocol UserPresenterDelegate: NSObjectProtocol {
    func saveUser(_ user: User)
}

class UserPresenter {
    weak var delegate: UserPresenterDelegate?
    private var user = User()

    func saveUser(_ user: User) {
        delegate?.saveUser(user)
    }

    func validate(mobileNumber: String) -> Bool {
        let alphaNumericRegex = "^[0-9]{11}$"
        let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
        return alphaNumericTest.evaluate(with: mobileNumber)
    }

    func validate(email: String) -> Bool {
        let regex = "([\\w-+]+(?:\\.[\\w-+]+)*@(?:[\\w-]+\\.)+[a-zA-Z]{2,7})"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: email)
    }
}
