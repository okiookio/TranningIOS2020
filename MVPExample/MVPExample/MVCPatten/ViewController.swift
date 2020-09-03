//
//  ViewController.swift
//  MVPExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmented: UISegmentedControl!
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButton(_ sender: Any) {
        print("Notify model")
        guard let name = nameTextField.text else { return }
        searchAgeOf(name: name)

    }
    
    @IBAction func goToMVP(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "MVPViewController") as! MVPViewController
        navigationController?.pushViewController(vc, animated: true)

    }

    private func searchAgeOf(name userName: String) {
        API.request(param: userName) { [weak self] (response) in
            self?.ageTextField.text = "\(response)"
        }
    }
}


