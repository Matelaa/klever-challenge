//
//  ManagerViewModel.swift
//  crypto-manager
//
//  Created by Matela on 04/12/23.
//

import Foundation

class ManagerViewModel: ObservableObject {
    @Published var managedCoins: [Manager] = []
    @Published var alreadyManagedCoin: Bool = false
    
    func addCoinManagement(coin: Coin, importance: Importance) {
        if RealmSingleton.shared.get().contains(where: { $0.coin?.id == coin.id }) {
            self.alreadyManagedCoin = true
            return
        }
        
        let coinObject = CoinObject(coin: coin)
        let manager = ManagerObject(coin: coinObject, importance: importance)
        
        try? RealmSingleton.shared.save(managerObject: manager)
        
        self.alreadyManagedCoin = false
    }
    
    func getManagedCoins() {
        self.managedCoins = RealmSingleton.shared.get()
    }
    
    func deleteManagedCoin(managedCoin: Manager) {
        self.managedCoins = RealmSingleton.shared.delete(managedCoin: managedCoin)
    }
    func updateManagedCoin(managedCoin: Manager, importance: Importance) {
        self.managedCoins = RealmSingleton.shared.update(managedCoin: managedCoin, importance: importance)
    }
}
