//
//  User.swift
//  MVPExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

enum Gender: Int {
    case Male = 0
    case Female = 1
}

struct User {
    var id: Int?
    var name: String?
    var mobileNumber: String?
    var email: String?
    var age: Int?
    var gender: Gender?
}

