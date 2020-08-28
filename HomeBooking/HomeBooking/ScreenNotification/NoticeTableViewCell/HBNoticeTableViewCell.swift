//
//  HBNoticeTableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBNoticeTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero

    }

    func bind(_ object: Any?) {
        let data = object as? HBNotice
        let seen: Bool = data?.seen ?? false
        containerView.backgroundColor = seen ? UIColor.white : UIColor(named: "orange")
        arrowButton.tintColor = seen ? UIColor.gray : UIColor.white
    }
}
