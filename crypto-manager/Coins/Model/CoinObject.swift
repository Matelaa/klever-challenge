//
//  CoinObject.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import Foundation
import RealmSwift

class CoinObject: Object, Identifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var symbol: String
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var currentPrice: Double
    @Persisted var priceChangePercentage: Double
    
    convenience init(coin: Coin) {
        self.init()
        self.id = coin.id
        self.symbol = coin.symbol
        self.name = coin.name
        self.image = coin.image
        self.currentPrice = coin.currentPrice
        self.priceChangePercentage = coin.priceChangePercentage
    }
}
