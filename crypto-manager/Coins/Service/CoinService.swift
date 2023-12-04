//
//  CoinService.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import Foundation

class CoinService {
    let baseURL: String = AppConfig.baseURL
    let coinsPerPage: Int = 20
    let vsCurrency: String = "usd"
    let apiKey: String = AppConfig.apiKey
    
    func getCoins(page: Int, completion: @escaping ([Coin]) -> Void) {
        let url = URL(string: "\(self.baseURL)/coins/markets?vs_currency=\(self.vsCurrency)&per_page=\(self.coinsPerPage)&page=\(page)&x_cg_demo_api_key=\(self.apiKey)")
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let coins = try? JSONDecoder().decode([Coin].self, from: data) {
                        DispatchQueue.main.async {
                            completion(coins)
                        }
                    } else {
                        print("Erro ao decodificar os dados.")
                    }
                } else {
                    print("Erro: \(String(describing: error))")
                }
            }
            task.resume()
        }
    }
}
