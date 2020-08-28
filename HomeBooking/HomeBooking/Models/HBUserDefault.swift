//
//  HBUserDefault.swift
//  HomeBooking
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation
//khong tim hieu tiep ve generic
protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}

//*break
enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"

    var errorDescription: String? {
        rawValue
    }
}

class HBUserdefault {
    static let shared = HBUserdefault()

    private init() {

    }
    // Khai báo : let userDefault = UserDefault.standard
    private let userDefault = UserDefaults.standard


    // Set dữ liệu : userDefault.set(value, forKey : "key name")
    func setString(_ string: String, key: String) {
        userDefault.set(string, forKey: key)
        userDefault.synchronize()
    }
    func setInt(_ int: Int, key: String) {
        userDefault.set(int, forKey: key)
        userDefault.synchronize()
    }
    // Get dữ liệu : userDefault.kiểu dữ liệu(forKey : "key name")
    func getString(key: String) -> String {
        return userDefault.string(forKey: key) ?? ""
    }
    func getInt(key: String) -> Int {
        return userDefault.integer(forKey: key)
    }
    // Xoá dữ kiệu theo key :
    func removeKey(_ key: String) {
        userDefault.removeObject(forKey: key)
        userDefault.synchronize()
    }
    // Xoá toàn bộ dữ liệu :
    func removeAll() {
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
    }
    // Lưu object
    
//    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
//        let encoder = JSONEncoder()
//        do {
//            let data = try encoder.encode(object)
//            userDefault.set(data, forKey: forKey)
//        } catch {
//            throw ObjectSavableError.unableToEncode
//        }
//    }

    func setObjectData<T:Codable>(_ object: T, forKey: String) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            
            userDefault.set(data, forKey: forKey)
            userDefault.synchronize()
        } catch {
            print(error)
        }
    }
    
//    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
//        guard let data = userDefault.data(forKey: forKey) else { throw ObjectSavableError.noValue }
//        let decoder = JSONDecoder()
//        do {
//            let object = try decoder.decode(type, from: data)
//            return object
//        } catch {
//            throw ObjectSavableError.unableToDecode
//        }
//    }
    func getObjectData<T: Decodable>(forKey: String, type: T.Type) -> T? {
        guard let data = userDefault.data(forKey: forKey) else { return nil }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            print(error)
        }
        return nil
    }

    // Save Array
    func setArray<T>(_ arr: T, key: String) {
        userDefault.set(arr, forKey: key)
        userDefault.synchronize()
    }
    func getArray<T>(key: String, arrType: T.Type) -> [T] {
        return userDefault.array(forKey: key) as? [T] ?? [T]()
    }
}
