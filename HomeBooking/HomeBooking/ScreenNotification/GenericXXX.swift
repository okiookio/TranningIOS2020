//
//  GenericXXX.swift
//  HomeBooking
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib? {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}

extension UITableView {
    func registerCell<T: Reusable >(_ item: T.Type) {
        if let nib = item.nib {
            register(nib, forCellReuseIdentifier: item.reuseIdentifier)
        } else {
            register(T.self, forCellReuseIdentifier: item.reuseIdentifier)
        }
    }
}
