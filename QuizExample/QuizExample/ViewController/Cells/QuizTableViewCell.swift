//
//  QuizTableViewCell.swift
//  QuizExample
//
//  Created by helIgate on 9/7/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var titleAnswerLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var prefixAnswerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func bind(index: Int, answer: String) {
        var prefix: String
        switch index {
        case 0:
            prefix = "A."
        case 1:
            prefix = "B."
        case 2:
            prefix = "C."
        case 3:
            prefix = "D."
        default:
            prefix = ""
            break
        }
        prefixAnswerLabel.text = prefix
        titleAnswerLabel.text = answer
    }

    func selected(_ isSelected: Bool) {
        checkButton.isSelected = isSelected
    }
}
