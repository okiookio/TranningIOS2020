//
//  HBCheckout2ViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBCheckout2ViewController: UIViewController {

    @IBOutlet weak var cardNumberTextField: UIPaddingTextField!
    @IBOutlet weak var expiryTextField: UIPaddingTextField!
    @IBOutlet weak var cvvTextField: UIPaddingTextField!
    @IBOutlet weak var nameTextField: UIPaddingTextField!
    @IBOutlet weak var saveCardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTounchGoToConfirmation(_ sender: Any) {
        
        
    }
    @IBAction func didTouchSaveCardButton(_ sender: Any) {
        if let button = sender as? UIButton{
            saveCardButton.isSelected = !button.isSelected
        }
    }
}
