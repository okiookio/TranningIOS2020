//
//  API.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation
import Alamofire

protocol APIProtocol {
//    static var shared: APIProtocol { get }
    func request<T:Decodable>(url: URL, complete: ((T?, String?) -> Void)?)
}

class API: APIProtocol {
    static var shared = API()

    func request<T:Decodable>(url: URL, complete: ((T?, String?) -> Void)?) {
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let error = err {
                complete?(nil, error.localizedDescription)
            } else if let d = data {
                let decoder = JSONDecoder.iso8601
                do {
                    let t = try decoder.decode(T.self, from: d)
                    complete?(t, nil)
                } catch {
                    print(error.localizedDescription)
                    complete?(nil, error.localizedDescription)
                    return
                }
            }
        }.resume()
    }
}

extension JSONDecoder {
    static var iso8601: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
