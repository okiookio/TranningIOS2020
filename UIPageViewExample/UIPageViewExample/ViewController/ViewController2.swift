//
//  ViewController2.swift
//  UIPageViewExample
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    private let userDefault = UserDefaults.standard
    private var user: UserModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("View controller 2")
        print(userDefault.string(forKey: "name") ?? "")

    }

}
