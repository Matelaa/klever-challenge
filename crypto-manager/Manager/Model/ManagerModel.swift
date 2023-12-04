//
//  ManagerModel.swift
//  crypto-manager
//
//  Created by Matela on 03/12/23.
//

import Foundation

struct Manager: Codable, Equatable, Identifiable {
    let id: UUID
    let coin: Coin
}
