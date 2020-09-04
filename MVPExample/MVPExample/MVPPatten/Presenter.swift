//
//  Presenter.swift
//  MVPExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

protocol MVPViewControllerProtocol: class {
    func getName() -> String?
    func setAge(age: Int)
}

protocol PresenterProtocol: class {
    func searchAgeByName()
    var delegate: MVPViewControllerProtocol? { get set }
}

class Presenter: PresenterProtocol {

    weak var delegate: MVPViewControllerProtocol?

    init(delegate: MVPViewControllerProtocol) {
        self.delegate = delegate
    }
    
    func searchAgeByName() {
        if let name = delegate?.getName() {
            searchAgeOf(name: name)
        }
    }
    
    private func searchAgeOf(name userName: String) {
        API.request(param: userName) { [weak self] (response) in
            self?.delegate?.setAge(age: response)
        }
    }

}
