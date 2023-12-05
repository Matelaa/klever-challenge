//
//  CoinDetailView.swift
//  crypto-manager
//
//  Created by Matela on 04/12/23.
//

import SwiftUI

struct CoinDetailView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            AsyncImage(url: URL(string: coin.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
            } placeholder: {
                ProgressView()
                    .frame(height: 150)
            }
            
            Text(coin.name)
                .font(.title)
                .foregroundColor(.primary)
            
            Text(coin.symbol)
                .font(.headline)
                .foregroundColor(.secondary)
            
            Divider()
            
            Text("Preço Atual: $\(coin.currentPrice, specifier: "%.2f")")
                .font(.headline)
            
            let priceChangeColor: Color = coin.priceChangePercentage >= 0 ? .green : .red
            
            HStack {
                Text("Variação nas últimas 24 horas: ")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("\(coin.priceChangePercentage)%")
                    .font(.headline)
                    .foregroundColor(priceChangeColor)
            }
            
            NavigationLink(destination: CreateManagerView(coin: self.coin)) {
                Text("Start managing this coin")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(coin.name)
    }
}

//#Preview {
//    DetailCoinView()
//}
