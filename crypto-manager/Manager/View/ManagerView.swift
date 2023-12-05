//
//  ManagerView.swift
//  crypto-manager
//
//  Created by Matela on 02/12/23.
//

import SwiftUI

struct ManagerView: View {
    @StateObject private var viewModel = ManagerViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if self.viewModel.managedCoins.isEmpty {
                    VStack {
                        Spacer()
                        Text("You don't have any coin added to your management.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                            .padding()
                        Spacer()
                    }
                } else {
                    ForEach(self.viewModel.managedCoins) { managedCoin in
                        if let coin = managedCoin.coin {
                            NavigationLink(destination: CoinDetailView(coin: coin)) {
                                ManagerCoinListRow(managedCoin: managedCoin)
                                    .swipeActions(allowsFullSwipe: false) {
                                        Button(role: .destructive) {
                                            self.viewModel.deleteManagedCoin(managedCoin: managedCoin)
                                        } label: {
                                            Label("Delete", systemImage: "trash.fill")
                                        }
                                    }
                            }
                        }
                    }
                }
            }
            .onAppear() {
                self.viewModel.getManagedCoins()
            }
            .navigationTitle("Coins")
        }
    }
}

//#Preview {
//    ManagerView()
//}
