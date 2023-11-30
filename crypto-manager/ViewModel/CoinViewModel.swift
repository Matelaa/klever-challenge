//
//  CoinViewModel.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import Foundation

class CoinViewModel: ObservableObject {
    private let service = CoinService()
    
    @Published var coins: [Coin] = []
    
    func fetchCoins() {
        self.service.getCoins { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
}
