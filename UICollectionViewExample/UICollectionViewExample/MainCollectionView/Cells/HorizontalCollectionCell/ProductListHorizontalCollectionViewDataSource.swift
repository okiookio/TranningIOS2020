//
//  HorizontalCollectionViewDataSource.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ProductListHorizontalCollectionViewDataSource: NSObject {
    private weak var collectionView: UICollectionView!

    init(collectionView: UICollectionView,
         spacingSection: CGFloat = 8.0,
         spacingCell: CGFloat = 8.0,
         cellRatio: CGFloat = 338 / 289) {
        super.init()
        self.collectionView = collectionView
        self.spacingSection = spacingSection
        self.spacingCell = spacingCell
        self.cellRatio = cellRatio
        self.configSubsView()
    }

    private var items: [ProductItemProtocol] = []

    private func configSubsView() {
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")

        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)

        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .lightGray
        collectionView.delegate = self
        collectionView.dataSource = self

    }

    private var spacingSection: CGFloat = 8.0
    private var spacingCell: CGFloat = 8.0
    private var cellRatio: CGFloat = 338 / 289

    func bind(data: Any) {
        let data = data as? [ProductItemProtocol]
        self.items = data ?? []
        collectionView.reloadData()
    }
    var didSelectAt:((_ indexPath: IndexPath,_ item: ProductItemProtocol) -> Void)?
}

extension ProductListHorizontalCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        let item = items[indexPath.row]
        cell.bindData(item)
        return cell
    }
}

extension ProductListHorizontalCollectionViewDataSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height - spacingSection * 2
        let width = height * cellRatio
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .create(all: spacingSection)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

extension ProductListHorizontalCollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        didSelectAt?(indexPath, item)
    }
}

extension UIEdgeInsets {
    static func create(all: CGFloat) -> UIEdgeInsets {
        return .init(top: all, left: all, bottom: all, right: all)
    }
}
