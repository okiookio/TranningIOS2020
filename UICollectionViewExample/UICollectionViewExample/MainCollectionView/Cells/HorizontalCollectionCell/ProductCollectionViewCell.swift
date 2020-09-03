//
//  ProductCollectionViewCell.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    private let kCellRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = kCellRadius
        containerView.clipsToBounds = true
        
    }
    
    func bindData(_ data : Any) {
        let data = data as? ProductItemProtocol
        thumbnailImage.loadImage(with: data?.displayThumnail())
        titleLabel.text = data?.displayName()
        descriptionLabel.text = data?.displayDescription()
        priceLabel.text = data?.displayPrice()
    }

}
