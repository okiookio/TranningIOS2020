//
//  QuizModel.swift
//  QuizExample
//
//  Created by helIgate on 9/7/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

protocol QuizProtocol {
    var question: String { get }
    var answers: [String] { get }
    var id: Int { get }
    init(id: Int, question: String, answers: [String])
}

struct QuizModel: QuizProtocol {
    init(id: Int, question: String, answers: [String]) {
        self.id = id
        self.question = question
        self.answers = answers
    }
    
    var id: Int
    var question: String
    var answers: [String]

    var selected: Int?
}

extension QuizModel {
    mutating func selectAnswer(at index: Int) {
        self.selected = index
    }
}

extension QuizModel {
    static func genericRamdom<T: QuizProtocol>(count: Int = 10) -> [T] {
        var arrayQuiz: [T] = []
        for i in 1...count {
            let question = String.random(200)
            let answers = String.randoms(150, count: 4)
            let quiz = T(id: i, question: question, answers: answers)
            arrayQuiz.append(quiz)
        }
        return arrayQuiz
    }
}

extension String {
    static func random(_ n: Int) -> String
    {
        let digits = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        var result = ""

        for _ in 0..<n {
            result += String(digits.randomElement()!)
        }

        return result
    }
    static func randoms(_ n: Int, count: Int) -> [String] {
        var strs = [String]()
        for _ in 0..<count {
            let str = random(n)
            strs.append(str)
        }
        return strs
    }
}
