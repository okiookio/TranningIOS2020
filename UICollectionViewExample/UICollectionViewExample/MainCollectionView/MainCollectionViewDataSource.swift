//
//  MainViewControllerDataSource.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/1/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

//https://qiita.com/akatsuki174/items/626fe4d71990694f946f#xib%E3%81%A7%E4%BD%9C%E3%81%A3%E3%81%9F%E3%83%98%E3%83%83%E3%83%80%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B

import UIKit

class MainCollectionViewDataSource: NSObject {
    private weak var collectionView: UICollectionView!

    init(collectionView: UICollectionView,
         spacingSection: CGFloat = 8,
         spacingRow: CGFloat = 8) {
        super.init()
        self.collectionView = collectionView
        self.spacingSection = spacingSection
        self.spacingRow = spacingRow

        self.configSubviews()
    }

    private func configSubviews() {
        collectionView.register(UINib(nibName: "ListProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListProductCollectionViewCell")
        collectionView.register(UINib(nibName: "MainCollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainCollectionHeader")
        collectionView.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func bind(data: Any) {
        guard let data = data as? ListProduct else { return }
        refreshUI(with: data)
    }

    private var templates: [TemplateItem] = []
    private var products: [ProductItem] = []
    private var foodAndDrinks: [FoodAndDrinkItem] = []
    private var thankYouGifts: [ThankYouGiftItem] = []

    private func refreshUI(with data: ListProduct) {
        templates = data.displayTemplates() ?? []
        products = data.displayProduct() ?? []
        foodAndDrinks = data.displayFoodAndDrink() ?? []
        thankYouGifts = data.displayThankYouGift() ?? []

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

    var didTouchReadMore: ((_ indexSection: Int) -> Void)?
}

extension MainCollectionViewDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MainSection.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let title = MainSection(rawValue: indexPath.section)?.sectionTitle

        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerMainCollection = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MainCollectionHeader", for: indexPath) as? MainCollectionHeader else { return UICollectionReusableView() }
            headerMainCollection.bind(title: title)
            headerMainCollection.didTouchReadMore = { [weak self] in
                self?.didTouchReadMore?(indexPath.section)
            }
            return headerMainCollection
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let with = collectionView.frame.width - spacingSection * 2
        let height: CGFloat = 50
        return CGSize(width: with, height: height)
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

extension MainCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
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

extension MainCollectionViewDataSource: UICollectionViewDelegate {

}
