//
//  UserTableViewCell.swift
//  UITableView
//
//  Created by helIgate on 8/18/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

/*
 
 protocol UserTableViewCellDelegate : NSObjectProtocol {
     func cell(_ cell: UserTableViewCell?, didTouchFollowAt index: IndexPath)
 }
 
 */


class UserTableViewCell: UITableViewCell {

   // weak var delegate: UserTableViewCellDelegate?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNickName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var btnFollow: UIButton!
    @IBOutlet weak var imageConfirm: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageUser.layer.cornerRadius = self.imageUser.frame.size.width / 2
        self.imageUser.clipsToBounds = true
        self.imageUser.contentMode = .scaleToFill
        self.btnFollow.layer.cornerRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindDataWithItem(item : UserModel) {
        lblName.text = item.name
        lblNickName.text = item.nickName
        lblStatus.text = item.status?.text
        if(item.confirm == true){
            imageConfirm.isHidden = false
        }else{
            imageConfirm.isHidden = true
        }
        let url = URL(string: item.imageUrl!)!
        imageUser.load(url: url)
    }
    
    /*
    
    private var index: IndexPath!
    
    func bind(index: IndexPath) {
        self.index = index
    }
     
    */
    
    @IBAction func pressFollow(_ sender: Any) {
        print("Press Follow")
       // delegate?.cell(self, didTouchFollowAt: index)
        didTouchFollow?()
    }
    
    @IBAction func pressX(_ sender: Any) {
        print("Press X")
        didTouchRemove?()
        
    }
    var didTouchRemove:(() -> Void)?
    
    var didTouchFollow:(() -> Void)?
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
