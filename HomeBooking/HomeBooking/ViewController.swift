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
    override func viewDidAppear(_ animated: Bool) {
//        let orderFunctions = HBHigherOrderFunctions.share
//        orderFunctions.map()
//        orderFunctions.compactMap()
//        orderFunctions.filter()
//        orderFunctions.reduce()
//        print(orderFunctions.contains())
//        orderFunctions.removeAll()
//        orderFunctions.sorted()
//        orderFunctions.split()
//        orderFunctions.allSatisfy()
//        orderFunctions.partition()
//        orderFunctions.firstIndex()
        
    }

    @IBAction func goToFilter(_ sender: Any) {
        let filterViewController = FilterViewController()
        filterViewController.updateFilter = { (data) in
            print(data)
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
    @IBAction func goToCheckout2(_ sender: UIButton) {
        let storybroad: UIStoryboard = UIStoryboard(name: "HBCheckout2", bundle: nil)
        let hbCheckout2ViewController = storybroad.instantiateViewController(identifier:          "HBCheckout2") as! HBCheckout2ViewController
        hbCheckout2ViewController.didTouchGoToConfirmation = { [weak self] (data) in
//            print("Data checkout \(data)")
        }
        if let data = HBUserdefault.shared.getObjectData(forKey: "saveDataCheckout2", type: HBCheckout2.self) {
            hbCheckout2ViewController.setDataCheckout(data)
            navigationController?.pushViewController(hbCheckout2ViewController, animated: true)
        } else {
            navigationController?.pushViewController(hbCheckout2ViewController, animated: true)
        }

//        let data = HBCheckout2(cardNumber: "1234 5678 9123 4567", expiry: "08/23", cvv: "123", name: "JONH WICK")
//        goX(data)
    }

    func goX(_ data: HBCheckout2) {
        let storybroad: UIStoryboard = UIStoryboard(name: "HBCheckout2", bundle: nil)
        let vc = storybroad.instantiateViewController(identifier: "XViewController") as! XViewController
        vc.completeWithVisaCard = { [weak self] (card) in
//            print(card)
        }
        if let data = HBUserdefault.shared.getObjectData(forKey: "saveDataCheckout2", type: HBCheckout2.self) {
            vc.setData(data)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func goToNotice() {
        let storybroad: UIStoryboard = UIStoryboard(name: "HBNotice", bundle: nil)
        let vc = storybroad.instantiateViewController(identifier: "HBNotice") as! HBNoticeViewController
        vc.didTouchBack = { [weak self] (arr) in
            print(arr)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToUICollectionView(_ sender: Any) {
        let storybroad : UIStoryboard = UIStoryboard(name: "HBUICollectionView", bundle: nil)
        let vc = storybroad.instantiateViewController(identifier: "UICollectionView") as! HBUICollectionViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

