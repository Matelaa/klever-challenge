//
//  RealmConfig.swift
//  crypto-manager
//
//  Created by Matela on 04/12/23.
//

import Foundation
import RealmSwift

class RealmSingleton {
    var realm: Realm?
    
    static let shared: RealmSingleton = {
        return RealmSingleton()
    }()
    
    private init() {
        do {
            self.realm = try Realm()
            print("Realm initialized, path: \(self.realm!.configuration.fileURL?.absoluteString)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func save(managerObject: ManagerObject) throws {
        try realm?.write {
            realm?.add(managerObject, update: .modified)
        }
    }
    
    func get() -> [Manager] {
        if let results = realm?.objects(ManagerObject.self) {
            
            let sortedResults = results.sorted { $0.importance.rawValue > $1.importance.rawValue }
            
            let managedCointsObjectToModel = sortedResults.compactMap { managerObject in
                if let coinObject = managerObject.coin,
                   let importance = Manager.Importance(rawValue: managerObject.importance.rawValue) {
                    let coin = Coin(coinObject: coinObject)
                    
                    return Manager(id: managerObject.id.stringValue, coin: coin, importance: importance)
                } else {
                    return nil
                }
            }
            
            return managedCointsObjectToModel
        }
        
        return []
    }
    
    func delete(managedCoin: Manager) -> [Manager] {
        guard let coin = managedCoin.coin,
              let resultCoinObject = realm?.object(ofType: CoinObject.self, forPrimaryKey: coin.id),
              let objectIdFromString = try? ObjectId(string: managedCoin.id),
              let managerObject = realm?.object(ofType: ManagerObject.self, forPrimaryKey: objectIdFromString) else {
            return []
        }
        
        do {
            try realm?.write {
                realm?.delete(resultCoinObject)
                realm?.delete(managerObject)
            }
            return self.get()
        } catch {
            print("Error deleting objects: \(error)")
            return []
        }
    }
    
    func update() {
        
    }
}
