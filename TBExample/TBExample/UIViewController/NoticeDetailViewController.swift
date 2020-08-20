//
//  NoticeDetailViewController.swift
//  TBExample
//
//  Created by helIgate on 8/20/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit
protocol NoticeProtocolDelegate {
    func updateNotice(data: Notification, position: Int)
}

class NoticeDetailViewController: UIViewController {
    var data: Notification?
    var index : Int?
    var deletage: NoticeProtocolDelegate?
    @IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        bindData(data!)
    }

    private func bindData(_ data: Notification) {
        print("\(data.title!)")
        titleTextField.text = data.title

    }
    @IBAction func update(_ sender: Any) {
        data?.title = titleTextField.text
        if let data = self.data {
//            deletage?.updateNotice(data: data, position: position!)
            updateNoticeDetail?(data,index!)
            dismiss(animated: true, completion: nil)
        }

    }

    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    var updateNoticeDetail : ((Notification, Int) -> Void)?

}
