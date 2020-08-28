//
//  HBNoticeViewController.swift
//  HomeBooking
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class HBNoticeViewController: UIViewController {
    private var arrNotice: [HBNotice] = [HBNotice]() {
        didSet {
            tableView.reloadData()
        }
    }


    @IBOutlet weak var tableView: UITableView!
    var didTouchBack: ((_ arr: [Int]) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        configDisplay()
        arrNotice = HBNotice.genericRamdom()
    }

    func configDisplay() {
        tableView.register(UINib(nibName: "HBNoticeTableViewCell", bundle: nil), forCellReuseIdentifier: "HBNoticeCell")
        tableView.register(UINib(nibName: "HBNoticeHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HBNoticeHeaderCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let notSeen = arrNotice.filter({ $0.seen == false }).map({ $0.id }).compactMap({ $0 })
        self.didTouchBack?(notSeen)

        let listId = arrNotice.map { (notice) -> Int? in
            return notice.id
        }.compactMap({ $0 })
        
//        0 < A < 100
        
        // if neu a > 100  thi a = 100
        // else a < 0 thi a = 0
        var a = 800
        a = min(max(0, a), 100)
        
        
    }
}

extension HBNoticeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotice.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HBNoticeCell", for: indexPath) as? HBNoticeTableViewCell else { return UITableViewCell() }
        let notice = arrNotice[indexPath.row]
        cell.bind(notice)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "HBNoticeHeaderCell") as? HBNoticeHeaderTableViewCell else { return UITableViewCell() }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }


}
extension HBNoticeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var object = arrNotice[indexPath.row]
        object.seen = true
        arrNotice.remove(at: indexPath.row)
        arrNotice.insert(object, at: indexPath.row)
        tableView.reloadData()

    }
}
