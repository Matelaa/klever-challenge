//
//  Coin.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import Foundation

struct CoinModel: Codable, Equatable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let priceChangePercentage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case priceChangePercentage = "price_change_percentage_24h"
    }
}
