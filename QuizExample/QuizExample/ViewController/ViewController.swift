//
//  ViewController.swift
//  QuizExample
//
//  Created by helIgate on 9/7/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

//https://stackoverflow.com/questions/44195986/uitableview-header-dynamic-height-in-run-time
//http://ios-tutorial.com/custom-header-view-xib-uitableview/

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    private var dataQuiz: [QuizModel] = [QuizModel]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataQuiz = QuizModel.genericRamdom()
        configUITableView()
    }

    private func configUITableView() {
        tableView.register(UINib(nibName: "QuizTableViewCell", bundle: nil), forCellReuseIdentifier: "QuizTableViewCell")
        tableView.register(UINib(nibName: "QuizHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "QuizHeader")

        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 64


        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataQuiz.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QuizHeader") as? QuizHeader else { return UITableViewHeaderFooterView() }
        let question = dataQuiz[section].question
        let quizIndex = dataQuiz[section].id
        header.bind(index: quizIndex, title: question)
        return header
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataQuiz[section].answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTableViewCell", for: indexPath) as! QuizTableViewCell
        let quiz = dataQuiz[indexPath.section]
        let answer = quiz.answers[indexPath.row]
        let index = indexPath.row
        cell.bind(index: index, answer: answer)
        
        if let select = quiz.selected {
            let isSelected: Bool = index == select
            cell.selected(isSelected)
        } else {
            cell.selected(false)
        }
        return cell
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dataQuiz[indexPath.section].selectAnswer(at: indexPath.row)
    }
}

