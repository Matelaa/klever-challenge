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
        VStack(alignment: .center, spacing: 20) {
            //MARK: - TODO: Remover esses forces
            AsyncImage(url: URL(string: self.coin!.image)) { image in
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
            
            //MARK: - TODO: Remover esses optionals
            Text(self.coin?.name ?? "Coin Name")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Select the importance of managing this coin for you")
                .font(.headline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 20) {
                ColorOptionView(color: .green, text: "High", isSelected: selectedColor == .green) {
                    selectedColor = .green
                }
                
                ColorOptionView(color: .yellow, text: "Medium", isSelected: selectedColor == .red) {
                    selectedColor = .yellow
                }
                
                ColorOptionView(color: .gray, text: "Low", isSelected: selectedColor == .gray) {
                    selectedColor = .gray
                }
            }
            
            Button(action: {
                if let coin = self.coin, let selectedColor = self.selectedColor {
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
        //MARK: - TODO: Remover esses optionals
        .navigationTitle("Manage \(coin?.name ?? "")")
        .navigationBarTitleDisplayMode(.inline)
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


struct ColorOptionView: View {
    let color: Color
    let text: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Circle()
                .fill(color)
                .frame(width: 60, height: 60)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: isSelected ? 3 : 0)
                )
                .onTapGesture {
                    onTap()
                }
            
            Text(text)
                .font(.caption)
                .foregroundColor(.primary)
        }
    }
}

//#Preview {
//    CreateManagerView()
//}
