//
//  ViewController.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func goToCodable(_ sender: Any){
        let vc = storyboard?.instantiateViewController(identifier: "CodableViewController") as! CodableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToAlamofire(_ sender: Any){
        let vc = storyboard?.instantiateViewController(identifier: "AlamofireViewController") as! AlamofireViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



