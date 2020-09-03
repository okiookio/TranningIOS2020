//
//  MVPViewController.swift
//  MVPExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class MVPViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmented: UISegmentedControl!

    private lazy var presenter: PresenterProtocol = Presenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButton(_ sender: Any) {
        presenter.searchAgeByName()
    }

}

extension MVPViewController: MVPViewControllerProtocol {
    func getName() -> String? {
        return nameTextField.text
    }

    func setAge(age: Int) {
        ageTextField.text = "\(age)"
    }
}
