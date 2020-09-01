//
//  ProductCollectionViewCell.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindData(_ data : Any) {
        guard let data = data as? ProductItem else { return }
        thumbnailImage.image = UIImage(named: "image")
        titleLabel.text = data.name
        descriptionLabel.text = data.description
        priceLabel.text = String(data.price!)
    }

}
