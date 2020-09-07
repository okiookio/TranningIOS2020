//
//  UserModels.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

enum Gender: String, Codable {
    case male
    case female
}

struct UserModel: Codable {
    var id: String?
    var createdAt: String?
    var name: String?
    var avatar: URL?
    var gender: Bool?
}
