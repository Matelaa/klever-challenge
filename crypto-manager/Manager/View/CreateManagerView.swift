//
//  CreateManagerView.swift
//  crypto-manager
//
//  Created by Matela on 04/12/23.
//

import SwiftUI

struct CreateManagerView: View {
    let coin: Coin?
    @StateObject private var viewModel = ManagerViewModel()
    @State private var selectedColor: Color?
    @State private var showAlert: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if let coin = self.coin {
            VStack(alignment: .center, spacing: 20) {
                AsyncImage(url: URL(string: coin.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                        )
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                
                .padding()
                
                Text(coin.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Select the importance of managing this coin for you")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
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
                        
                        self.viewModel.addCoinManagement(coin: coin, importance: importance)
                        self.showAlert = true
                    }
                }) {
                    Text("Done")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedColor ?? .gray)
                        .cornerRadius(12)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(self.alertTitle()),
                        message: Text(self.alertMessage()),
                        dismissButton: .default(Text("Ok"), action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }))
                }
                
                Spacer()
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .cornerRadius(20)
            .navigationTitle("Manage \(coin.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func alertTitle() -> String {
        return self.viewModel.alreadyManagedCoin
        ? "Attention"
        : "Success"
    }
    
    private func alertMessage() -> String {
        return self.viewModel.alreadyManagedCoin
        ? "This coin is already being managed."
        : "This coin is now being managed."
    }
}

//#Preview {
//    CreateManagerView()
//}
