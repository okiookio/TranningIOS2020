//
//  NotificationTBCell.swift
//  TBExample
//
//  Created by helIgate on 8/19/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
//titleLabel
//notificatioIconImageView
class NotificationTBCell: UITableViewCell {
    @IBOutlet weak var viewRootCell: UIView!
    @IBOutlet weak var viewBorderImage: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var notificationImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewRootCell.layer.cornerRadius = 20
        viewBorderImage.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(_ data : Notification) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        DateLabel.text = data.dispayDate()
        notificationImageView.image = data.displayIcon()
        if data.seen {
            viewRootCell.backgroundColor = UIColor(named: "Blue")
        }else{
            viewRootCell.backgroundColor = UIColor(named: "ColorBackgoundCell")
        }
    }
}
