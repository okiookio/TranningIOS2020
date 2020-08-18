//
//  ViewController.swift
//  UITableView
//
//  Created by helIgate on 8/18/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataUser = dataSample
    var user = UserModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func didTouchFollowAt(index: IndexPath) {
        print(index.row)
    }
    func didTouchRemoveAt(index : IndexPath){
        dataUser.remove(at: index.row)
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        {
            let item = dataUser[indexPath.row]
            cell.bindDataWithItem(item: item)
//            cell.bind(index: indexPath)
//            cell.delegate = self
            cell.didTouchFollow = { [weak self] in
                self?.didTouchFollowAt(index: indexPath)
            }
            cell.didTouchRemove = { [weak self] in
                self?.didTouchRemoveAt(index: indexPath)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataUser.count
    }
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        let data = dataUser[indexPath.row]
        if let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Detail") as? DetailViewController {
            detailViewController.data = data
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
//        self.present(nextViewController!, animated: true, completion: nil)
//        user = dataUser[indexPath.row]
    }
}

/*

extension ViewController: UserTableViewCellDelegate {
    func cell(_ cell: UserTableViewCell?, didTouchFollowAt index: IndexPath) {
          didTouchFollowAt(index: index)
    }
}
 
 */
