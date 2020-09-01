//
//  ViewController.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let itemProduct: [ProductItemProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSubsView()
    }
    private func configSubsView() {
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell")

        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)

        collectionView.collectionViewLayout = layout

        collectionView.delegate = self
        collectionView.dataSource = self

    }

    private var spacingSection: CGFloat = 8.0
    private var spacingCell: CGFloat = 8.0
    private var cellRatio: CGFloat = 4 / 3
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemProduct.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        let item = itemProduct[indexPath.row]
        cell.bindData(item)
        return cell
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
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

extension ViewController: UICollectionViewDelegate {

}

extension UIEdgeInsets {
    static func create(all: CGFloat) -> UIEdgeInsets {
        return .init(top: all, left: all, bottom: all, right: all)
    }
}
