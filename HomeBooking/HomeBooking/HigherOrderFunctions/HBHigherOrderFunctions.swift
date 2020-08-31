//
//  HBHigherOrderFunctions.swift
//  HomeBooking
//
//  Created by helIgate on 8/31/20.
//  Copyright © 2020 helIgate. All rights reserved.

//https://www.appcoda.com/higher-order-functions-swift/#Get_Prepared_to_work_with_Higher_Order_Functions_in_Swift
//https://medium.com/if-let-swift-programming/higher-order-functions-in-swift-d8175243d0ee

import Foundation

class HBHigherOrderFunctions {
    let arrayString = ["Mot", "Hai", "Ba", "Bon", "Nam", "Sau", "Bay", "Tam", "Chin"]
    let arrayInt = [1, 9, 2, 3, 5, 9, 4, 5, 6, 7, 8, 9, nil, nil]
    let arrayObject = HBNotice.genericRamdom(count: 20, titleCount: 10)
    let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]

    static let share = HBHigherOrderFunctions()

    func map() {
        let arrayResult = arrayString.map { (string) -> String in
            return string.uppercased()
        }
        print(arrayResult)
    }
    func compactMap() {
        let arr = arrayInt.compactMap { (number) -> String? in
            if let number = number {
                return String(number)
            } else {
                return nil
            }
        }
        print(arr)
    }
    func filter() {
//        let arr = arrayInt.filter { (number) -> Bool in
//            if let number = number {
//                return number > 5
//            } else {
//                return false
//            }
//        }
        let arr = arrayObject.filter { (notice) -> Bool in
            return notice.seen == true
        }.first { (notice) -> Bool in
            guard let noticeID = notice.id else { return false }
            return noticeID <= 5
        }
        print(arr ?? "")
    }
    func reduce() {
//        let result = friendsAndMoney.reduce(0) { (result, data) -> Double in
//            return result + data.value
//        }
        let arr = arrayInt.compactMap({ $0 })
        let result = arr.reduce(0) { (equals, number) -> Int in
            return equals + number
        }
        print(result)
    }
    func contains() -> Bool {
//        let result = arrayObject.contains { (notice) -> Bool in
//            return notice.title == "true"
//        }
        let result = friendsAndMoney.contains { (data) -> Bool in
            return data.value >= 155.0
        }
        return result
    }
    func removeAll() {
        var arr = arrayInt.compactMap({ $0 })
        arr.removeAll { (number) -> Bool in
            return number <= 5
        }
        print(arr)
    }
    func sorted() {
        let arr = arrayInt.compactMap({ $0 })
        print(arr)
        let result = arr.sorted { (num1, num2) -> Bool in
            print("number 1 : \(num1), number 2 : \(num2)")
            return num1 > num2
        }
        print(result)
    }
    func split() {
        let str = "Hello world"
        let result = str.split(separator: " ")
        print(result)
    }
    func allSatisfy() {
        let result = arrayInt.allSatisfy { (number) -> Bool in
            guard let number = number else { return false }
            return number > 5
        }
        print(result)
    }
    func partition() {
        var arr = arrayInt.compactMap({ $0 })
        let result = arr.partition { (number) -> Bool in
//            guard let number = number else { return false }
            return number >= 5
        }
        print(result)
        print(arr)
    }
    func firstIndex() {
        let result = arrayObject.firstIndex { (notice) -> Bool in
            guard let no = notice.title else { return false }
            return no.contains("t")
        }
        print(result ?? -1 as Int)
    }
}
