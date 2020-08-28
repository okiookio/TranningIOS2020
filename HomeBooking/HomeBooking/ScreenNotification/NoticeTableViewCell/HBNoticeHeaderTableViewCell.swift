//
//  HBNoticeHeaderTableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBNoticeHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var specialLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchButton.layer.cornerRadius = 10
    }
}
