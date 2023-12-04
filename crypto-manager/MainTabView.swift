//
//  MainTabView.swift
//  crypto-manager
//
//  Created by Matela on 03/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ManagerView()
                .tabItem {
                    Label("Manager", systemImage: "list.bullet")
                }
            
            ContentView()
                .tabItem {
                    Label("Coins", systemImage: "dollarsign.circle")
                }
        }
    }
}

//#Preview {
//    MainTabView()
//}
