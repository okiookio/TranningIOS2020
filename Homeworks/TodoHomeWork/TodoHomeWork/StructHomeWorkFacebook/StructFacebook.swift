//
//  StructFacebook.swift
//  TodoHomeWork
//
//  Created by helIgate on 9/19/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

struct StructFacebook: Codable {
    var status: Int?
    var photos: [Photo]?
    var contactInfo: ContactInfo?
    var demographics: Demographics?
    var socialProfiles: [SocialProfile]?
}

struct Photo: Codable {
    var typeName: String?
    var type: String?
    var typeId: String?
    var url: String?
    var isPrimary: Bool?
}

struct ContactInfo: Codable {
    var familyName: String?
    var fullName: String?
    var givenName: String?
}

struct Demographics: Codable {
    var gender: String?
}

struct SocialProfile: Codable {
    var id: String?
    var typeName: String?
    var username: String?
    var type: String?
    var typeId: String?
    var url: String?
}
