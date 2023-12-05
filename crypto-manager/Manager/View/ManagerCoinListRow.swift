//
//  ManagerCoinListRow.swift
//  crypto-manager
//
//  Created by Matela on 03/12/23.
//

import SwiftUI

struct ManagerCoinListRow: View {
    var managedCoin: Manager
    
    var body: some View {
        HStack {
            //MARK: - TODO: Remover esses forces
            AsyncImage(url: URL(string: self.managedCoin.coin!.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(self.managedCoin.coin!.name)
                    .font(.headline)
                Text(self.managedCoin.coin!.symbol)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(circleColor(for: self.managedCoin.importance))
        }
    }
    
    func circleColor(for importance: Manager.Importance) -> Color {
        print(importance)
        switch importance {
        case .high:
            return .green
        case .medium:
            return .yellow
        case .low:
            return .gray
        }
    }
}

//#Preview {
//    ManagerCointListRow()
//}
