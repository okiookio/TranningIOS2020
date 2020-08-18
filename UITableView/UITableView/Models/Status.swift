//
//  Status.swift
//  UITableView
//
//  Created by helIgate on 8/18/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

enum Status{
    case fb
    case likefb
    case populer
    
    var text : String {
        switch self {
        case .fb:
            return "Bạn bè facebook"
        case .likefb:
            return "Bạn cũng thích trang này trên facebook"
        case .populer:
            return "Phổ biến"
        }
    }
}
