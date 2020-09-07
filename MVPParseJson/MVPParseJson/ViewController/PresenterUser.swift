//
//  PresenterUser.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

protocol PresenterUserDelegate: class, ProgressHUB, DisplayDialogProtocol {
    func setUsers(users: [UserModel])
    func setUser(user: UserModel)
}

protocol PresenterUserProtocol {
    var delegate: PresenterUserDelegate? { get set }
    func getListUser()
    func getUser(by id: Int)
}

class PresenterUser: PresenterUserProtocol {

    internal weak var delegate: PresenterUserDelegate?

    init(delegate: PresenterUserDelegate) {
        self.delegate = delegate
    }

    func getListUser() {
        guard let url = URL(string: "https://5f51a0b25e98480016123baf.mockapi.io/v1/users") else { return }
        delegate?.showProgress()
        APIAlamofire.shared.request(url: url) { [weak self] (response: [UserModel]?, error: String?) in
            guard let self = self else { return }
            self.delegate?.dismissProgress()
            if let message = error {
                self.delegate?.showError(title: "Error", message: message)
            } else if let users = response {
                self.delegate?.setUsers(users: users)
            }
        }
    }

    func getUser(by id: Int) {
        guard let url = URL(string: "https://5f51a0b25e98480016123baf.mockapi.io/v1/users/\(id)") else { return }
        delegate?.showProgress()
        APIAlamofire.shared.request(url: url) { [weak self] (response: UserModel?, error: String?) in
            guard let self = self else { return }
            self.delegate?.dismissProgress()
            if let message = error {
                self.delegate?.showError(title: "Error", message: message)
            } else if let user = response {
                self.delegate?.setUser(user: user)
            }
        }
    }
}
