//
//  HBNotice.swift
//  HomeBooking
//
//  Created by helIgate on 8/28/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

struct HBNotice {
    var id: Int?
    var title: String?
    var seen: Bool?
}

extension HBNotice {
    static func genericRamdom(count: Int = 100, titleCount: Int = 300, randomSeen: Bool = true) -> [HBNotice] {
        var arrayNotice = [HBNotice]()
        for i in 0...count {
            var notice = HBNotice(id: i)
            notice.title = String.random(titleCount)
            if randomSeen {
                notice.seen = Int.random(from: 1, to: 2) == 1
            }
            arrayNotice.append(notice)
        }
        return arrayNotice
    }
}
