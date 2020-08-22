//
//  FilterViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/21/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    private var filterData = HBFilter()
    var updateFilter: ((_ filter: HBFilter) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


    }

    @IBAction func selectBudget(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let randomString = String.random(50)
        showAlert(with: "Bugget", message: randomString, okAction: {
            self.filterData.yourBudget = randomString
            button.setTitle(randomString, for: .normal)
        }, cancelAction: nil)
    }

    @IBAction func selectStarRating(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let randomInt = Int.random(from: 1, to: 10)
        showAlert(with: "Star rating", message: "\(randomInt)", okAction: {
            self.filterData.startRating = randomInt
            button.setTitle("\(randomInt)", for: .normal)
        }, cancelAction: nil)
    }

    @IBAction func selectReviewScore(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let randomInt = Int.random(from: 1, to: 10)
        showAlert(with: "Review score", message: "\(randomInt)", okAction: {
            self.filterData.reviewScore = randomInt
            button.setTitle("\(randomInt)", for: .normal)
        }, cancelAction: nil)
    }

    @IBAction func selectMeals(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let randomString = String.random(50)
        showAlert(with: "Meals", message: randomString, okAction: {
            self.filterData.meals = randomString
            button.setTitle(randomString, for: .normal)
        }, cancelAction: nil)
    }

    @IBAction func selectType(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let randomInt = Int.random(from: 1, to: 2)
        showAlert(with: "Type", message: "\(randomInt)", okAction: {
            self.filterData.type = randomInt
            button.setTitle("\(randomInt)", for: .normal)
        }, cancelAction: nil)
    }

    @IBAction func selectBreakfast(_ sender: UISwitch) {
        filterData.breakfastIncluted = sender.isOn
    }
    @IBAction func selectDeals(_ sender: UISwitch) {
        filterData.deals = sender.isOn
    }
    @IBAction func selectOnlyShow(_ sender: UISwitch) {
        filterData.onlyShowAvailable = sender.isOn
    }
    @IBAction func buttonApply(_ sender: UIButton) {
        updateFilter?(filterData)
        navigationController?.popViewController(animated: true)
    }

    func showAlert(with title: String, message: String, okAction: (() -> Void)? = nil, cancelAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            okAction?()
        }))
        if cancelAction != nil {
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                cancelAction?()
            }))
        }
        present(alert, animated: true, completion: nil)
    }

}
