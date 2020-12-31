//
//  SingleData.swift
//  WidgetTest
//
//  Created by user on 2020/10/30.
//

import Foundation
import HandyJSON

var sampleData: CoinData {
    let path = Bundle.main.path(forResource: "content.json", ofType: nil)
    let data = NSData.init(contentsOfFile: path!)
    let mainJson = try! JSONSerialization.jsonObject(with: data! as Data, options: []) as! [String: Any]
    let coinData = CoinData.deserialize(from: mainJson)!
    for sData in coinData.list! {
        let arr = sData.name!.split(separator: "/")
        sData.firstName = String(arr[0]) + " "
        sData.lastName = "/" + String(arr[1])
    }
    return coinData
}

class SingleData: HandyJSON, Identifiable {
    var name: String?
    var price: String?
    var changeRate: String?
    var cnyPrice: String?
    var firstName: String?
    var lastName: String?
    var line: [LinePoint]?
    
    required init() {}
}

class LinePoint: HandyJSON {
    var centerX: CGFloat?
    var colseY: CGFloat?
    
    required init() {}
}

struct DataLoader {
    static func fetch(tag: Int, completion: @escaping (Result<(CoinData, SingleData), Error>) -> Void) {
//        let singleDataUrl = URL(string: "")!
//        let task = URLSession.shared.dataTask(with: singleDataUrl) { (data, response, error) in
//            guard error == nil else {
//                completion(.failure(error!))
//                return
//            }
//            let mainJson = try! JSONSerialization.jsonObject(with: data! as Data, options: []) as! [String: Any]
//            let coinData = CoinData.deserialize(from: mainJson)!
//            for sData in coinData.list! {
//                let arr = sData.name!.split(separator: "/")
//                sData.firstName = String(arr[0]) + " "
//                sData.lastName = "/" + String(arr[1])
//            }
        let coinData = sampleData
            let singleData: SingleData!
            switch tag {
            case 1:
                singleData = coinData.btc
            case 2:
                singleData = coinData.eth
            case 3:
                singleData = coinData.dpom
            default:
                singleData = coinData.btc
            }
            completion(.success((coinData, singleData)))
//        }
//        task.resume()
    }
}


