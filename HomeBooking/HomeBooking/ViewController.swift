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

    private func loadData(_ data: HBFilter) {
        let budget = data.yourBudget
        var rating = ""
        if data.startRating == 0 {
            rating = "true"
        } else {
            rating = "false"
        }

        rating = (data.startRating ?? 0) == 0 ? "true" : "false"

        var viewScore = ""
        if data.reviewScore == 0 {
            viewScore = "true"
        } else {
            viewScore = "false"
        }
        let meals = data.meals
        let breakfast = data.breakfastIncluted
        let deals = data.deals
        let onlyShow = data.onlyShowAvailable
        print("Your Budget :\(budget), Star Rating : \(rating), Review Score : \(viewScore), Meals :\(meals), Breakfast :\(breakfast) \(deals) \(onlyShow)")
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
    @IBAction func goToCheckout(_ sender: UIButton){
        let storybroad : UIStoryboard = UIStoryboard(name: "HBCheckout", bundle: nil)
        let hbcheckout1ViewController = storybroad.instantiateViewController(withIdentifier: "HBCheckout1") as! HBCheckout1ViewController
        hbcheckout1ViewController.updateCheckout = { [weak self] (checkout) in
            print(checkout)
        }
        let checkout = HBCheckoutModel(fistName: "Hoang", lastName: "Kim", emailAddress: "Toi", address: "1", postCode: "2", country: "3", mobile: "4")
        hbcheckout1ViewController.bindDataCheckout(checkout)
        navigationController?.pushViewController(hbcheckout1ViewController, animated: true)
    }
}

