//
//  ViewController.swift
//  TBExample
//
//  Created by helIgate on 8/19/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
//Pefix+Feature+ClassSuper
//FNNotificationListViewControler

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var data: [Notification] = []
    private var noticeDetailViewController: NoticeDetailViewController?

    private let refreshControl = UIRefreshControl()


    override func viewDidLoad() {
        super.viewDidLoad()

        data = Notification.random(30)
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "NotificationTBCell", bundle: nil), forCellReuseIdentifier: "NotificationTBCell")
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self

        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }

        self.refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        self.refreshControl.tintColor = UIColor.lightGray

    }

    @objc private func updateData() {
        data = Notification.random(15)
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }

    func updateNotice(data: Notification, position: Int) {
        self.data[position] = data
        self.tableView.reloadData()
    }

    private func goToNoticeDetaiViewController(indexPath: IndexPath) {
        noticeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "NoticeDetail") as? NoticeDetailViewController
        noticeDetailViewController!.data = data[indexPath.row]
        noticeDetailViewController!.index = indexPath.row
        print("1")
        noticeDetailViewController?.updateNoticeDetail = { (data: Notification, index: Int) in
            print("2")
            self.updateNotice(data: data, position: index)
        }
//        noticeDetailViewController.deletage = self

        present(noticeDetailViewController!, animated: true, completion: nil)
    }


}
//extension ViewController: NoticeProtocolDelegate {
//    func updateNotice(data: Notification, position: Int) {
//        self.data[position] = data
//        self.tableView.reloadData()
//    }
//}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.data[indexPath.row]
        let cell: NotificationTBCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTBCell", for: indexPath) as! NotificationTBCell
        cell.bindData(item)
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Press \(indexPath.row)")

        data[indexPath.row].seen = true

        tableView.reloadData()

        self.goToNoticeDetaiViewController(indexPath: indexPath)

    }
}
