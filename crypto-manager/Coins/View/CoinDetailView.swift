//
//  DetailCoinView.swift
//  crypto-manager
//
//  Created by Matela on 04/12/23.
//

import SwiftUI

struct DetailCoinView: View {
    let coin: Coin
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
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
                
                // Lógica para determinar a cor do valor com base em priceChangePercentage
                let priceChangeColor: Color = coin.priceChangePercentage >= 0 ? .green : .red
                
                HStack {
                    Text("Variação nas últimas 24 horas: ")
                        .font(.headline)
                        .foregroundColor(.primary) // Cor padrão do texto
                    
//                    Text("\(coin.priceChangePercentage, specifier: "%.2f")%")
                    Text("\(coin.priceChangePercentage)%")
                        .font(.headline)
                        .foregroundColor(priceChangeColor) // Cor do valor
                }
                
                // Adicione mais informações conforme necessário
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(coin.name)
    }
}

//#Preview {
//    DetailCoinView()
//}
