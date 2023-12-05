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
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.headline)
                Text(coin.symbol)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.green)
        }
    }
}

//#Preview {
//    ManagerCointListRow()
//}
