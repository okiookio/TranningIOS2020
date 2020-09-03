//
//  API.swift
//  MVPExample
//
//  Created by helIgate on 9/3/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class API {
    static func request(param: String, callback: ((Int) -> Void)?) {
        print("Start request API with param ", param)
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(1.0)) {
            let result = 100
            print("Complete request API with response ", result)
            callback?(result)
        }
    }

}
