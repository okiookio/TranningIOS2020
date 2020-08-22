//
//  SwichTableViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/21/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class SwichTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabelViewCell: UILabel!
    @IBOutlet weak var buttonSwitch: UISwitch!
    
    var didTouchSwitch : ((_ status : Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindType(_ rowType : Any) {
        let type = rowType as? HBFilterViewController.HBFilterCellType
        titleLabelViewCell.text = type?.title
    }
    
    func bindData(_ dataCell : Bool) {
        if dataCell {
            buttonSwitch.isOn = true
        }else{
            buttonSwitch.isOn = false
        }
    }
    
    @IBAction func didSwitchButton(_ sender: UISwitch) {
        let status = sender.isOn
        self.didTouchSwitch?(status)
        
    }
    
}
