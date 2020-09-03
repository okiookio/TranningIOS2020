//
//  ExtenionUIImage.swift
//  UICollectionViewExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(with url: String?, contentMode mode: UIView.ContentMode = .scaleToFill) {
        //TODO: need update: Load image
        guard let urlImg = url, let urlImage = URL(string: urlImg) else { return }
        downloaded(from: urlImage, contentMode: mode)
    }
    private func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}



