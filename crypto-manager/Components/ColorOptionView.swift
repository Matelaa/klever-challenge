//
//  ColorOptionView.swift
//  crypto-manager
//
//  Created by Matela on 05/12/23.
//

import SwiftUI

struct ColorOptionView: View {
    let color: Color
    let text: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Circle()
                .fill(self.color)
                .frame(width: 60, height: 60)
                .overlay(
                    Circle()
                        .stroke(.cyan, lineWidth: self.isSelected ? 3 : 0)
                )
                .onTapGesture {
                    self.onTap()
                }
            
            Text(self.text)
                .font(.caption)
                .foregroundColor(.primary)
        }
    }
}

//#Preview {
//    ColorOptionView()
//}
