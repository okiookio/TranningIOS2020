//
//  HBFilterViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/21/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBFilterViewController: UIViewController {

    enum HBFilterCellType: Int, CaseIterable {
        case yourBugget
        case starRating
        case reviewScore
        case meals
        case type
        case breakfartIncluded
        case deals
        case onlyShowAvailable

        var title: String {
            switch self {

            case .yourBugget:
                return "Your budget"
            case .starRating:
                return "Star rating"
            case .reviewScore:
                return "Review score"
            case .meals:
                return "Meals"
            case .type:
                return "Type"
            case .breakfartIncluded:
                return "Breakfast Included"
            case .deals:
                return "Deals"
            case .onlyShowAvailable:
                return "Only Show Available"
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!

    private var filterData = HBFilter()
    
    var updateFilter: ((_ filter: HBFilter) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "SelectedTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectedTableViewCell")
        tableView.register(UINib(nibName: "SwichTableViewCell", bundle: nil), forCellReuseIdentifier: "SwichTableViewCell")

        tableView.dataSource = self
        tableView.delegate = self


    }



    @IBAction func buttonApply(_ sender: UIButton) {
        updateFilter?(filterData)
        navigationController?.popViewController(animated: true)
    }

    func showAlert(with title: String?, message: String?, okAction: (() -> Void)? = nil, cancelAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
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
extension HBFilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = HBFilterCellType(rawValue: indexPath.row) else { return UITableViewCell() }
        switch row {
        case .yourBugget:
            let cell: SelectedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SelectedTableViewCell", for: indexPath) as! SelectedTableViewCell
            cell.bindType(HBFilterCellType.yourBugget)
            cell.bindData(filterData.displayYourBudget())
            cell.didTounchButton = { [weak self] in
                let yourBudget = String.random(50)
                self?.showAlert(with: "Your budget", message: yourBudget, okAction: {
                    self?.filterData.yourBudget = yourBudget
                    tableView.reloadData()
                }, cancelAction: {
                    self?.filterData.yourBudget = nil
                    tableView.reloadData()
                })
            }
            return cell
        case .starRating:
            let cell: SelectedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SelectedTableViewCell", for: indexPath) as! SelectedTableViewCell
            cell.bindType(HBFilterCellType.starRating)
            cell.bindData(filterData.displayRating())
            cell.didTounchButton = { [weak self] in
                let rating = Int.random(from: 1, to: 5)
                self?.showAlert(with: "Star rating", message: String(rating), okAction: {
                    self?.filterData.startRating = rating
                    tableView.reloadData()
                }, cancelAction: nil)
            }
            return cell
        case .reviewScore:
            let cell: SelectedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SelectedTableViewCell", for: indexPath) as! SelectedTableViewCell
            cell.bindType(HBFilterCellType.reviewScore)
            cell.bindData(filterData.displayReviewScore())
            cell.didTounchButton = { [weak self] in
                let score = Int.random(from: 1, to: 5)
                self?.showAlert(with: "Review score", message: String(score), okAction: {
                    self?.filterData.reviewScore = score
                    tableView.reloadData()
                }, cancelAction: nil)
            }
            return cell
        case .meals:
            let cell: SelectedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SelectedTableViewCell", for: indexPath) as! SelectedTableViewCell
            cell.bindType(HBFilterCellType.meals)
            cell.bindData(filterData.displayMeals())
            cell.didTounchButton = { [weak self] in
                let meals = String.random(50)
                self?.showAlert(with: "Meals", message: meals, okAction: {
                    self?.filterData.meals = meals
                    tableView.reloadData()
                }, cancelAction: nil)
            }
            return cell
        case .type:
            let cell: SelectedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SelectedTableViewCell", for: indexPath) as! SelectedTableViewCell
            cell.bindType(HBFilterCellType.type)
            cell.bindData(filterData.displayType())
            cell.didTounchButton = { [weak self] in
                let type = Int.random(from: 0, to: 2)
                let msg = HBHotelFilterType(rawValue: type)?.text
                self?.showAlert(with: "Type", message: msg , okAction: {
                    self?.filterData.type = type
                    tableView.reloadData()
                }, cancelAction: nil)
            }
            return cell
        case .breakfartIncluded:
            let cell: SwichTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SwichTableViewCell", for: indexPath) as! SwichTableViewCell
            cell.bindType(HBFilterCellType.breakfartIncluded)
            cell.didTouchSwitch =  { [weak self] (isOn) in
                self?.filterData.breakfastIncluted = isOn
            }
            return cell
        case .deals:
            let cell: SwichTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SwichTableViewCell", for: indexPath) as! SwichTableViewCell
            cell.bindType(HBFilterCellType.deals)
            cell.didTouchSwitch = { [weak self] (isOn) in
                self?.filterData.deals = isOn
            }
            return cell
        case .onlyShowAvailable:
            let cell: SwichTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SwichTableViewCell", for: indexPath) as! SwichTableViewCell
            cell.bindType(HBFilterCellType.onlyShowAvailable)
            cell.didTouchSwitch = { [weak self] (isOn) in
                self?.filterData.onlyShowAvailable = isOn
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HBFilterCellType.allCases.count
    }

}
extension HBFilterViewController: UITableViewDelegate {
    // lấy vị trí cell
    // -> show alert lên
    // -> lấy dữ liệu trả về từ alert truyền vào button của cell tương ứng.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
