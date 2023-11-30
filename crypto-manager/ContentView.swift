//
//  ContentView.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CoinViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if self.viewModel.coins.isEmpty {
                    ProgressView("Loading...")
                        .onAppear {
                            self.viewModel.fetchCoins()
                        }
                } else {
                    List(self.viewModel.coins, id: \.id) { coin in
                        VStack(alignment: .leading) {
                            Text(coin.name)
                                .font(.headline)
                            Text(coin.symbol)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Crypto Manager")
        }
    }
}

//#Preview {
//    ContentView()
//}
