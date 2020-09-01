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

    var didSelectTemplateItem: ((TemplateItem) -> Void)?
    var didSelectProductItem: ((ProductItem) -> Void)?
    var didSelectFoodAndDrinkItem: ((FoodAndDrinkItem) -> Void)?
    var didSelectThankYouGiftItem: ((ThankYouGiftItem) -> Void)?

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
            cell.didSelectedAt = { [weak self] (index, item) in
                guard let selectedItem = item as? TemplateItem else { return }
                self?.didSelectTemplateItem?(selectedItem)
            }
            cell.bind(data: templates)
        case .products:
            cell.didSelectedAt = { [weak self] (index, item) in
                guard let selectedItem = item as? ProductItem else { return }
                self?.didSelectProductItem?(selectedItem)
            }
            cell.bind(data: products)
        case .foodAndDrinks:
            cell.didSelectedAt = { [weak self] (index, item) in
                guard let selectedItem = item as? FoodAndDrinkItem else { return }
                self?.didSelectFoodAndDrinkItem?(selectedItem)
            }
            cell.bind(data: foodAndDrinks)
        case .thankYouGifts:
            cell.didSelectedAt = { [weak self] (index, item) in
                guard let selectedItem = item as? ThankYouGiftItem else { return }
                self?.didSelectThankYouGiftItem?(selectedItem)
            }
            cell.bind(data: thankYouGifts)
        case .none:
            return UICollectionViewCell()
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


