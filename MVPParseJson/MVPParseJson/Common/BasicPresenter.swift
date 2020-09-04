//
//  BasicPresenter.swift
//  MVPParseJson
//
//  Created by helIgate on 9/4/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

struct AlertModel {
    var title: String?
    var message: String?
}
protocol BasicPresenter {
    var api: APIProtocol {get}
    var progress: Bool {get set}
    var alert: AlertModel {get set}
}
class BasicPresenterImp: BasicPresenter {

    
    var progress: Bool
    
    var alert: AlertModel
    

}
