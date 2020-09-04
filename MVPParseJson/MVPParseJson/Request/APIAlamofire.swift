//
//  APIAlamofire.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//
//https://codewithchris.com/alamofire/
//https://blog.codavel.com/handson-alamofire-tutorial

import UIKit
import Alamofire

class APIAlamofire: APIProtocol {
     static var shared = APIAlamofire()
    
    func request<T>(url: URL, complete: ((T?, String?) -> Void)?) where T: Decodable {
        requestDecodable(url: url, complete: complete)
    }
     
    private func basicRequest<T>(url: URL, complete: ((T?, String?) -> Void)?) where T: Decodable {
        AF.request(url).response { response in
            if let error = response.error {
                complete?(nil, error.errorDescription)
            } else if let data = response.data {
                let decoder = JSONDecoder.iso8601
                do {
                    let value = try decoder.decode(T.self, from: data)
                    complete?(value, nil)
                } catch {
                    print(error.localizedDescription)
                    complete?(nil, error.localizedDescription)
                    return
                }
            }
        }
    }

    private func requestDecodable<T>(url: URL, complete: ((T?, String?) -> Void)?) where T: Decodable {
        AF.request(url).responseDecodable(of: T.self, decoder: JSONDecoder.iso8601) { response in
            if let data = response.value {
                complete?(data, nil)
            } else if let error = response.error {
                complete?(nil, error.errorDescription)
            }
        }
    }

}

