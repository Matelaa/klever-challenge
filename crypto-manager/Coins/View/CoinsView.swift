//
//  CoinsView.swift
//  crypto-manager
//
//  Created by Matela on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CoinViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if self.viewModel.coins.isEmpty {
                    ProgressView("Loading...")
                        .onAppear {
                            self.viewModel.fetchCoins()
                        }
                } else {
                    List(self.viewModel.coins) { coin in
                        CoinRow(coin: coin)
                            .onAppear {
                                if self.viewModel.checkIsLast(coin: coin) {
                                    self.viewModel.fetchCoins()
                                }
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
