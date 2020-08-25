//
//  ViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/21/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToFilter(_ sender: Any) {
        let filterViewController = FilterViewController()
        filterViewController.updateFilter = { (data) in
            print(data)
//            self.loadData(data)
        }
        navigationController?.pushViewController(filterViewController, animated: true)
    }

    @IBAction func goToTableFilter(_ sender: Any) {
        let hbFilterViewController = HBFilterViewController()
        let filter = HBFilter(yourBudget: "Budget to you", startRating: 5, reviewScore: 3, meals: "ABC", breakfastIncluted: true, deals: false, onlyShowAvailable: true, type: 8)
        hbFilterViewController.setFilter(filter)
        hbFilterViewController.updateFilter = { [weak self] (data) in
            print(data)
        }
        navigationController?.pushViewController(hbFilterViewController, animated: true)
    }
    @IBAction func goToCheckout(_ sender: UIButton) {
        let storybroad: UIStoryboard = UIStoryboard(name: "HBCheckout", bundle: nil)
        let hbcheckout1ViewController = storybroad.instantiateViewController(withIdentifier: "HBCheckout1") as! HBCheckout1ViewController
        hbcheckout1ViewController.updateCheckout = { [weak self] (checkout) in
            print(checkout)
        }
        let checkout = HBCheckoutModel()
        hbcheckout1ViewController.bindDataCheckout(checkout)
        navigationController?.pushViewController(hbcheckout1ViewController, animated: true)
    }
    @IBAction func goToUser(_ sender: UIButton) {
        let storybroad: UIStoryboard = UIStoryboard(name: "HBUser", bundle: nil)
        let hbUserViewController = storybroad.instantiateViewController(identifier: "UserController") as! HBUserViewController
        navigationController?.pushViewController(hbUserViewController, animated: true)
    }
    @IBAction func goToCheckout2(_ sender : UIButton){
        let storybroad: UIStoryboard = UIStoryboard(name: "HBCheckout2", bundle: nil)
        let hbCheckout2ViewController = storybroad.instantiateViewController(identifier: "HBCheckout2") as! HBCheckout2ViewController
        navigationController?.pushViewController(hbCheckout2ViewController, animated: true)
    }
}

