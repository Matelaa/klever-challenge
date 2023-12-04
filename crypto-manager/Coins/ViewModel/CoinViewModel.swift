//
//  CoinViewModel.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import Foundation

class CoinViewModel: ObservableObject {
    private let coinService = CoinService()
    @Published var coins: [Coin] = []
    private var currentPage: Int = 1
    
    func fetchCoins() {
        coinService.getCoins(page: currentPage) { receivedCoins in
            DispatchQueue.main.async {
                self.coins.append(contentsOf: receivedCoins)
                self.currentPage += 1
            }
        }
    }
    
    func checkIsLast(coin: Coin) -> Bool {
        return coin == self.coins.last ? true : false
    }
}
