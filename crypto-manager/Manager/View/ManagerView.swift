//
//  ManagerView.swift
//  crypto-manager
//
//  Created by Matela on 02/12/23.
//

import SwiftUI

struct ManagerView: View {
    @StateObject private var viewModel = CoinViewModel()
    
    let teste: [Coin] = [Coin(id: "bitcoin",
                              symbol: "btc",
                              name: "Bitcoin",
                              image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                              currentPrice: 39581,
                              priceChangePercentage: 1.91009),
                         
                         Coin(id: "bitcoin",
                              symbol: "btc",
                              name: "Bitcoin",
                              image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                              currentPrice: 39581,
                              priceChangePercentage: 1.91009)]
    
    var body: some View {
        NavigationView {
            List {
                if self.teste.isEmpty {
                    VStack {
                        Spacer()
                        Text("A lista está vazia")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                        Spacer()
                    }
                } else {
                    ForEach(self.teste) { coin in
                        ManagerCointListRow(coin: coin)
                    }
                }
            }
            .navigationTitle("Coins")
        }
    }
}

//#Preview {
//    ManagerView()
//}
