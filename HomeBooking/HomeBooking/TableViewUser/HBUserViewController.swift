//
//  HBUserViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBUserViewController: UIViewController {

    enum HBUserSettingType: Int, CaseIterable {
        case yourFavourites
        case payment
        case help
        case promotions
        case settings

        var name: String {
            switch self {
            case .yourFavourites:
                return "Your favourites"
            case .payment:
                return "Payment"
            case .help:
                return "Help"
            case .promotions:
                return "Promotions"
            case .settings:
                return "Settings"
            }
        }
        var icon: UIImage? {
            switch self {
            case .yourFavourites:
                return UIImage(named: "favouritesIcon")
            case .payment:
                return UIImage(named: "paymentIcon")
            case .help:
                return UIImage(named: "helpIcon")
            case .promotions:
                return UIImage(named: "promotionsIcon")
            case .settings:
                return UIImage(named: "settingsIcon")
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HBUserTableViewCell", bundle: nil), forCellReuseIdentifier: "HBUserTableViewCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
    }

    func didSelectAtRow(_ row: HBUserSettingType) {
        print(row.name)
    }
}

extension HBUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HBUserSettingType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = HBUserSettingType(rawValue: indexPath.row) else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: "HBUserTableViewCell", for: indexPath) as! HBUserTableViewCell
        cell.bind(row)
        
        return cell
    }
}

extension HBUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = HBUserSettingType(rawValue: indexPath.row) else { return }
        didSelectAtRow(row)
    }
}
