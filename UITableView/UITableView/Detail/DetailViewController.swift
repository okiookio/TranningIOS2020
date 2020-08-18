//
//  DetailViewController.swift
//  UITableView
//
//  Created by helIgate on 8/18/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var nickNameDetail: UILabel!
    var data: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imgUser.layer.cornerRadius = self.imgUser.frame.size.width / 2
        self.imgUser.clipsToBounds = true
        self.imgUser.contentMode = .scaleToFill
    }
    override func viewDidAppear(_ animated: Bool) {
        bindData(data!)
    }
    func bindData(_ data : UserModel) {
        nameDetail.text = data.name
        nickNameDetail.text = data.nickName
        let url = URL(string: data.imageUrl!)!
        imgUser.load(url: url)
    }

}
