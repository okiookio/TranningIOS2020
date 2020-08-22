//
//  SelectedTableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/21/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class SelectedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var didTounchButton: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(_ dataCell: Any?) {
        let data = dataCell as? String
        contentLabel.text = data
    }
    
    func bindType(_ rowType: Any) {
        let type = rowType as? HBFilterViewController.HBFilterCellType
        titleLabel.text = type?.title
    }

    @IBAction func didSelectedButton(_ sender: UIButton) {
        didTounchButton?()
    }
}
