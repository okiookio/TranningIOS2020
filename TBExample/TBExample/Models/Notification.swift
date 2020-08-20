//
//  Notification.swift
//  TBExample
//
//  Created by helIgate on 8/19/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

enum NotificationType: Int, CaseIterable {
    case add
    case remove
    case success
    case request

    var image: UIImage? {
        switch self {
        case .add:
            return UIImage(named: "NotificationAddIcon")
        case .remove:
            return UIImage(named: "NotificationRemoveIcon")
        case .success:
            return UIImage(named: "NotificationSuccessIcon")
        case .request:
            return nil
        }
    }
}

//Int
//Float
//String
//Date
//Resful




struct Notification: Codable {
    var imageName: String?
    var title: String?
    var description: String?
    var createDate: Date?
    var seen: Bool = false
    var type: Int?
}

extension Notification {
    func dispayDate() -> String? {
        guard let date = createDate else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }

    func displayIcon() -> UIImage? {
        guard let type = type else { return nil }
        return NotificationType(rawValue: type)?.image
    }
    static var random: NotificationType? {
        return NotificationType(rawValue: Int.random(from: 0, to: 10))
    }
    static func random(_ count: Int = 10) -> [Notification] {
        var arr = [Notification]()
        for i in 0..<count {
            let item = Notification(imageName: nil,
                                    title: .random(50),
                                    description: .random(i * 50) + .random(200),
                                    createDate: Date(),
                                    seen: false,
                                    type: .random(from: 0, to: 2))
            arr.append(item)
        }
        return arr
    }
}



protocol NoticeProtocol {
    var imageName: String { get set }
    var customProperty: Date? { get set }
    var createdDate: Date? { get set }

    func actionXXX()
    func getImageName() -> String?
}

struct XXXX {
    var notice: NoticeProtocol!

    func printXXX() {

        let imageX = notice.getImageName()
        print(imageX ?? "noname")
    }
}

struct ZZZZ: NoticeProtocol {
    var imageName: String

    var customProperty: Date?

    var createdDate: Date?

    func actionXXX() {
        print(#function)
    }

    func getImageName() -> String? {
        return "ZZZZZ"
    }

    var zzznewVar: String?
}

struct TTTT: NoticeProtocol {
    var imageName: String

    var customProperty: Date?

    var createdDate: Date?

    func actionXXX() {
        print(#function)
    }

    func getImageName() -> String? {
        return "TTTT"
    }

    func TTTTFUNC() {
        print(#function)
    }

}

let ttt = TTTT(imageName: "TTTTImageURL")
let zzz = ZZZZ(imageName: "ZZZZZImageURL", zzznewVar: "newvar z")
let xxx = XXXX(notice: ttt)
let xxx1 = XXXX(notice: zzz)


extension NoticeProtocol {
    var uuu: String? {
        get {
            return "xxxxxxxxxx"
        }
        set {
            _ = newValue
        }
    }

    func displayImage() -> UIImage? {
        return UIImage()
    }
}


extension NoticeProtocol where Self == TTTT {
    func displayTTTImage() -> UIImage? {
        self.TTTTFUNC()
        return UIImage()
    }
}

//print(ttt.displayTTTImage())
//print(zzz.displayImage())
