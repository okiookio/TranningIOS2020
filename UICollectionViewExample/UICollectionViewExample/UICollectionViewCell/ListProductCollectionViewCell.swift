//
//  ListProductCollectionViewCell.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ListProductCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!

    private var dataSource: ProductListHorizontalCollectionViewDataSource?

    var didSelectedAt: ((_ index: Int, _ item: ProductItemProtocol) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dataSource = ProductListHorizontalCollectionViewDataSource(collectionView: collectionView)
        dataSource?.didSelectAt = { [weak self] (index, item) in
            self?.didSelectedAt?(index.row, item)
        }
    }

    override func bind(data: Any) {
        dataSource?.bind(data: data)
    }
}
