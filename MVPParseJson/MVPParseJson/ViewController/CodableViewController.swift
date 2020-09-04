//
//  Codable.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class CodableViewController: BaseViewController {

    private lazy var presenter: PresenterUserProtocol = PresenterUser(delegate: self)

    private var users: [UserModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func requestButton(_ sender: Any) {
        presenter.getListUser()
    }
    
    @IBAction func requestUser(_ sender: Any) {
        presenter.getUser()
    }
}

extension CodableViewController: PresenterUserDelegate {
    func setUser(user: UserModel) {
        print(user)
    }
    
    func setUsers(users: [UserModel]) {
        self.users = users
        for item in users {
            print(item)
        }
    }
}
