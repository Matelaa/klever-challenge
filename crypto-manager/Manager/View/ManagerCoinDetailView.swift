//
//  ManagerCoinDetailView.swift
//  crypto-manager
//
//  Created by Matela on 05/12/23.
//

import SwiftUI

struct ManagerCoinDetailView: View {
    let managedCoin: Manager
    @State var viewModel: ManagerViewModel
    @State private var showAlert: Bool = false
    @State private var selectedColor: Color?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if let coin = self.managedCoin.coin {
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
                
                Text("Current price: $\(coin.currentPrice, specifier: "%.2f")")
                    .font(.headline)
                
                let priceChangeColor: Color = coin.priceChangePercentage >= 0 ? .green : .red
                
                HStack {
                    Text("Variation in the last 24 hours: ")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("\(coin.priceChangePercentage)%")
                        .font(.headline)
                        .foregroundColor(priceChangeColor)
                }
                
                HStack(spacing: 20) {
                    ColorOptionView(color: .green, text: "High", isSelected: self.selectedColor == .green) {
                        self.selectedColor = .green
                    }
                    
                    ColorOptionView(color: .yellow, text: "Medium", isSelected: self.selectedColor == .yellow) {
                        self.selectedColor = .yellow
                    }
                    
                    ColorOptionView(color: .gray, text: "Low", isSelected: self.selectedColor == .gray) {
                        self.selectedColor = .gray
                    }
                }
                
                Button(action: {
                    if let selectedColor = self.selectedColor {
                        let importance: Importance
                        switch selectedColor {
                        case .green:
                            importance = .high
                        case .yellow:
                            importance = .medium
                        case .gray:
                            importance = .low
                        default:
                            importance = .low
                        }
                        
                        self.viewModel.updateManagedCoin(managedCoin: self.managedCoin, importance: importance)
                        self.showAlert = true
                    }
                }) {
                    Text("Done")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(self.selectedColor)
                        .cornerRadius(12)
                }
                .onAppear {
                    self.selectedColor = self.colorFromImportance(importance: self.managedCoin.importance)
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(self.alertTitle()),
                        message: Text(self.alertMessage()),
                        dismissButton: .default(Text("Ok"), action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }))
                }
                
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle(coin.name)
        }
    }
    
    func colorFromImportance(importance: Manager.Importance) -> Color {
        switch importance {
        case .high:
            return .green
        case .medium:
            return .yellow
        case .low:
            return .gray
        }
    }
    
    private func alertTitle() -> String {
        return "Success"
    }
    
    private func alertMessage() -> String {
        return "Your managed coin has been updated"
    }
}

//#Preview {
//    ManagerCoinDetailView()
//}
