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
    

    override func configSubviews() {
        super.configSubviews()
        dataSource = MainCollectionViewDataSource(collectionView: collectionView)
        //closure
    }
}

