//
//  WholeData.swift
//  WidgetTest
//
//  Created by user on 2020/12/17.
//

import Foundation
import HandyJSON

class CoinData: HandyJSON {
    var btc: SingleData?
    var eth: SingleData?
    var dpom: SingleData?
    var list: [SingleData]?
    
    required init() {}
}
