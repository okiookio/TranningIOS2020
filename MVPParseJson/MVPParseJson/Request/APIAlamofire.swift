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
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 5
        AF.request(request).responseDecodable(of: T.self, decoder: JSONDecoder.iso8601) { response in
            switch response.result {
            case .success(_):
                if let data = response.value {
                    complete?(data, nil)
                }
            case .failure(let error):
                if let error = error.errorDescription {
                    complete?(nil, error)
                }
            }
        }

    }


}

//enum UserRouter: URLRequestConvertible {
//    case getUserBy(id: Int)
//    case getUsers
//
//
//    var url: String {
//        switch self {
//                case .getUserBy(let id):
//            return "https://5f51a0b25e98480016123baf.mockapi.io/v1/users/\(id)"
//        case .getUsers:
//            return "https://5f51a0b25e98480016123baf.mockapi.io/v1/users"
//
//        }
//    }
//
//    func asURLRequest() throws -> URLRequest {
//        let url =
//        var request = URLRequest(url: url)
//        request.method = .get
//
//        switch self {
//        case .getUserBy(let id):
//
//            break
//        case .getUsers:
//            break
//        }
//        return request
//
//    }
//
//
//}
