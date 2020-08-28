//
//  CodableExample.swift
//  HomeBooking
//
//  Created by helIgate on 8/28/20.
//  Copyright © 2020 helIgate. All rights reserved.
//
// https://developer.apple.com/documentation/foundation/jsonencoder
// https://developer.apple.com/documentation/foundation/jsondecoder
// https://www.hackingwithswift.com/articles/119/codable-cheat-sheet

import Foundation

class CodableExample {
    static let constaint = CodableExample()
    private init() { }

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func encode<T: Codable>(_ object: T) -> String? {
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(object)
            guard let result = String(data: data, encoding: .utf8) else { return nil }
            return result
        } catch {
            print(error)
        }
        return nil
    }

    func decode<T: Decodable>(data: String, type: T.Type) -> T? {
        do {
            let dataFormat = Data(data.utf8)
            let data = try decoder.decode(type, from: dataFormat)
            return data
        } catch {
            print(error)
        }
        return nil
    }
    
    


}
