//
//  HBCollectionViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/31/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
import WSTagsField


class HBCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containtView: UIView!
    @IBOutlet weak var tagTextField: WSTagsField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containtView.backgroundColor = .random()
        configuraTagTextField()
    }
    private func configuraTagTextField(){
//        tagTextField.shouldTokenizeAfterResigningFirstResponder = true
//        tagTextField.onDidAddTag = { fields, tag in
//            print("DidAddTag", tag.text)
//        }
    }

    func bindData(_ text: Any?) {
        guard let title = text as? String else { return }
        titleLabel.text = title
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1.0
        )
    }
}
