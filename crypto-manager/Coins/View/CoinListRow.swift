//
//  CoinRow.swift
//  crypto-manager
//
//  Created by Matela on 02/12/23.
//

import SwiftUI

struct CoinRow: View {
    let coin: Coin
    
    var body: some View {
        NavigationLink(destination: CoinDetailView(coin: self.coin)) {
            HStack {
                AsyncImage(url: URL(string: self.coin.image)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.coin.name)
                        .font(.headline)
                    Text(self.coin.symbol)
                        .font(.subheadline)
                }
            }
        }
    }
}
