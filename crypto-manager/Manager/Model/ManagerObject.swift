//
//  ManagerObject.swift
//  crypto-manager
//
//  Created by Matela on 03/12/23.
//

import Foundation
import RealmSwift

class ManagerObject: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var coin: CoinObject?
    @Persisted var importance: Importance = .low
    
    convenience init(coin: CoinObject? = nil, importance: Importance) {
        self.init()
        self.coin = coin
        self.importance = importance
    }
}

enum Importance: Int, PersistableEnum {
    case high = 2
    case medium = 1
    case low = 0
}
