//
//  MainCollectionHeader.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class MainCollectionHeader: UICollectionReusableView {
    @IBOutlet private weak var titleHeaderLabel: UILabel!
    @IBOutlet private weak var readMoreButton: UIButton!

    var didTouchReadMore: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func bind(title: String?) {
        titleHeaderLabel.text = title
    }

    @IBAction func didTouchReadMoreButton(_ sender: Any) {
        self.didTouchReadMore?()
    }

}
