//
//  QuizHeader.swift
//  QuizExample
//
//  Created by helIgate on 9/7/20.
//  Copyright © 2020 helIgate. All rights reserved.
//
// ref: https://nshipster.com/uitableviewheaderfooterview/
// ref: http://ios-tutorial.com/custom-header-view-xib-uitableview/

import UIKit

class QuizHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var quizIndexLabel: UILabel!
    
    @IBOutlet weak var quizQuestionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view = UIView(frame: self.frame)
        view.backgroundColor = .white
        backgroundView = view
    }
    
    func bind(index: Int, title : String?) {
        quizQuestionLabel.text = title
        quizIndexLabel.text = "Câu \(index):"
    }

}
