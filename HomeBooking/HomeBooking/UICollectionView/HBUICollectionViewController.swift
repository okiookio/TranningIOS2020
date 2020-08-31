//
//  HBUICollectionViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/31/20.
//  Copyright © 2020 helIgate. All rights reserved.
//
//https://fxstudio.dev/basic-ios-tutorial-collection-view/
//https://theswiftdev.com/ultimate-uicollectionview-guide-with-ios-examples-written-in-swift/

//rotate refresh: https://stackoverflow.com/questions/36884376/swift-how-to-refresh-uicollectionview-layout-after-rotation-of-the-device/42174492


import UIKit

class HBUICollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let notice: [HBNotice] = HBNotice.genericRamdom(count: 50, titleCount: 10)
    private let layout = UICollectionViewFlowLayout()
    var statusBarOrientation: UIInterfaceOrientation? {
        get {
            guard let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation else { return nil }
            return orientation
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "HBCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UICollectionCell")


        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

//        layout.minimumInteritemSpacing = 5
//        layout.minimumLineSpacing = 5

        collectionView.collectionViewLayout = layout

        collectionView.dataSource = self
        collectionView.delegate = self

    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension HBUICollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notice.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionCell", for: indexPath) as? HBCollectionViewCell else { return UICollectionViewCell() }
        let title = notice[indexPath.row].title
        cell.bindData(title)
        return cell
    }
}

extension HBUICollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)  -   \(indexPath.row)")
    }
}

extension HBUICollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        let screenWith = UIScreen.main.bounds.width - 10
//        return CGSize(width: screenWith, height: (screenWith / 3) * 5 / 4)

        guard let isLandscape = statusBarOrientation?.isLandscape else { return CGSize() }
        if isLandscape {
            let screenWith = collectionView.frame.width - 1 * 8
            return CGSize(width: screenWith / 2, height: (screenWith / 3) * 5 / 4)
        } else {
            let screenWith = collectionView.frame.width - 1 * 8
            return CGSize(width: screenWith, height: (screenWith / 3) * 5 / 4)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 4, left: 4, bottom: 4, right: 4)
    }
}
