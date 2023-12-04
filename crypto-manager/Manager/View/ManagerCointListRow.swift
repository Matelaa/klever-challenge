//
//  ManagerCointListRow.swift
//  crypto-manager
//
//  Created by Matela on 03/12/23.
//

import SwiftUI

struct ManagerCointListRow: View {
    var coin: Coin
    
    var body: some View {
        HStack {
            // Imagem à esquerda
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
            }
            
            // Informações da moeda
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.headline)
                Text(coin.symbol)
                    .font(.subheadline)
            }
            
            Spacer() // Espaço para empurrar a imagem verde para a direita
            
            // Imagem verde à direita
            Image(systemName: "circle.fill")
                .foregroundColor(.green)
                .frame(width: 20, height: 20)
        }
        .padding(.vertical, 8)
    }
}

//#Preview {
//    ManagerCointListRow()
//}
