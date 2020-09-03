//
//  MainViewController.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: MainCollectionViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()

        let data = ListProduct.dummy()
        dataSource?.bind(data: data)

    }

    private func didSeclectedTemplateItem(_ item: ProductItemProtocol) {
        print(item)
    }

    private func didSeclectedProductItem(_ item: ProductItemProtocol) {
        print(item)
    }

    private func didSeclectedFoodAndDrinkItem(_ item: ProductItemProtocol) {
        print(item)
    }

    private func didSeclectedThankYouGiftItem(_ item: ProductItemProtocol) {
        print(item)
    }

    private func didTouchReadMoreButton(_ index: Int) {
        print(index)
    }


    override func configSubviews() {
        super.configSubviews()
        dataSource = MainCollectionViewDataSource(collectionView: collectionView)
        //closure
        dataSource?.didSelectTemplateItem = { [weak self] (item) in
            self?.didSeclectedTemplateItem(item)
        }

        dataSource?.didSelectProductItem = { [weak self] (item) in
            self?.didSeclectedProductItem(item)
        }

        dataSource?.didSelectFoodAndDrinkItem = { [weak self] (item) in
            self?.didSeclectedFoodAndDrinkItem(item)
        }

        dataSource?.didSelectThankYouGiftItem = { [weak self] (item) in
            self?.didSeclectedThankYouGiftItem(item)
        }
        dataSource?.didTouchReadMore = { [weak self] (indexSection) in
            self?.didTouchReadMoreButton(indexSection)
        }
    }
}


