//
//  ViewController+ProgressHUB.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
import PKHUD

protocol ProgressHUB {

}

extension ProgressHUB {
    func showProgress() {
        DispatchQueue.main.async {
            HUD.show(.progress)
        }
    }
    func dismissProgress() {
        DispatchQueue.main.async {
            HUD.hide()
        }
    }
}

extension UIViewController: ProgressHUB { }
extension UIView: ProgressHUB { }
