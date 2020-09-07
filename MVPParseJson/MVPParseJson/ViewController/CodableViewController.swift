//
//  Codable.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
import Alamofire

class CodableViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    private lazy var presenter: PresenterUserProtocol = PresenterUser(delegate: self)

    private var users: [UserModel] = [] {
        didSet {
            configUITableView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getListUser()
    }

    private func configUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension CodableViewController: PresenterUserDelegate {
    func setUser(user: UserModel) {
        showAlert(title: user.name ?? "", message: "\(user.avatar!)")
    }

    func setUsers(users: [UserModel]) {
        self.users = users
    }

}

extension CodableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = users[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.createdAt
    
        cell.selectionStyle = .none
        return cell
    }
}

extension CodableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = users[indexPath.row]
//        showAlert(title: item.name ?? "", message: "\(String(describing: item.avatar!))")
        guard let id = item.id, let userID = Int(id) else { return }
        presenter.getUser(by: userID)
    }
}
