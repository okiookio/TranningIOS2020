//
//  ViewController.swift
//  UIPageViewExample
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let userDafault = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View controller 1")
        userDafault.set("Kim Toi", forKey: "name")

    }


}

