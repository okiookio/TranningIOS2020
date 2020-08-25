//
//  HBUserTableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/25/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBUserTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func bind(_ data : Any?) {
        let row = data as? HBUserViewController.HBUserSettingType
        nameLabel.text = row?.name
        iconImage.image = row?.icon
    }
}
