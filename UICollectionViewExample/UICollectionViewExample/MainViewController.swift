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
    private var listProduct = ListProduct() {
        didSet {
            refreshUI(with: self.listProduct)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        listProduct = ListProduct.dummy()
        collectionView.reloadData()

    }
    
    override func configSubviews() {
        super.configSubviews()
        collectionView.register(UINib(nibName: "ListProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListProductCollectionViewCell")
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private var templates: [TemplateItem] = []
    private var products: [ProductItem] = []
    private var foodAndDrinks: [FoodAndDrinkItem] = []
    private var thankYouGifts: [ThankYouGiftItem] = []

    private func refreshUI(with data: ListProduct) {
        templates = self.listProduct.displayTemplates() ?? []
        products = self.listProduct.displayProduct() ?? []
        foodAndDrinks = self.listProduct.displayFoodAndDrink() ?? []
        thankYouGifts = self.listProduct.displayThankYouGift() ?? []

        collectionView.reloadData()
    }

    enum MainSection: Int, CaseIterable {
        case templates
        case products
        case foodAndDrinks
        case thankYouGifts

        var sectionTitle: String {
            switch self {
            case .templates:
                return "Templates"
            case .products:
                return "Products"
            case .foodAndDrinks:
                return "Food and drink"
            case .thankYouGifts:
                return "Thank you gift"
            }
        }

        var height: CGFloat {
            return 192
        }

    }

    private var spacingSection: CGFloat = 8
    private var spacingRow: CGFloat = 8
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MainSection.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListProductCollectionViewCell", for: indexPath) as! ListProductCollectionViewCell
        let section = MainSection(rawValue: indexPath.section)
        switch section {
        case .templates:
            cell.bind(data: templates)
        case .products:
            cell.bind(data: products)
        case .foodAndDrinks:
            cell.bind(data: foodAndDrinks)
        case .thankYouGifts:
            cell.bind(data: thankYouGifts)
        case .none:
            break
        }
        return cell
    }


}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - spacingSection * 2
        let height = MainSection(rawValue: indexPath.section)?.height ?? 0
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingRow
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .create(all: spacingSection)
    }
}

extension MainViewController: UICollectionViewDelegate {

}


