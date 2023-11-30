//
//  CoinService.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import Foundation

class CoinService {
    let baseURL: String = "https://api.coingecko.com/api/v3"
    
    func getCoins(completion: @escaping ([Coin]) -> Void) {
        let url = URL(string: "\(baseURL)/coins/list")
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let coins = try? JSONDecoder().decode([Coin].self, from: data)
                    if let coins = coins {
                        completion(coins)
                    }
                } else {
                    print("error: \(String(describing: error))")
                }
            }
            task.resume()
        }
    }
}
