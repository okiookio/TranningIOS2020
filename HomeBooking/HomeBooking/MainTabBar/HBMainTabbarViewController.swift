//
//  HBMainTabbarViewController.swift
//  HomeBooking
//
//  Created by helIgate on 9/24/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBMainTabbarViewController: UIViewController {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private var tabbarButtons: [HBTabbarButton]!
    
     private weak var mainTabBarController: UITabBarController? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarButtons.select(at: 0)
    }
    
    @IBAction func didTouchTabbarAt(_ sender: HBTabbarButton) {
        guard let index = tabbarButtons?.firstIndex(of: sender) else {
            return
        }
        tabbarButtons?.select(at: index)
        mainTabBarController?.selectedIndex = index
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let identifier = segue.identifier {
            switch identifier {
//            case R.segue.fnMainTabbarViewControler.embedTabbar.identifier:
//                if let vc = segue.destination as? UITabBarController {
//                    mainTabBarController = vc
//                }
            default:
                break
            }
        }
    }

}
