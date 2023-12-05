//
//  Manager.swift
//  crypto-manager
//
//  Created by Matela on 04/12/23.
//

import Foundation

struct Manager: Identifiable {
    var id: String
    var coin: Coin?
    var importance: Importance = .low
    
    enum Importance: Int {
        case high = 2
        case medium = 1
        case low = 0
    }
}
