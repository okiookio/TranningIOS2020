//
//  HBCollectionViewCell.swift
//  HomeBooking
//
//  Created by helIgate on 8/31/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit



class HBCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containtView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        containtView.backgroundColor = .random()
    }

    func bindData(_ text: String?) {
        guard let title = text else { return }
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
