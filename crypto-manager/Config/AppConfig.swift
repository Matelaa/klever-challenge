//
//  AppConfig.swift
//  crypto-manager
//
//  Created by Matela on 02/12/23.
//

import Foundation

struct AppConfig {
    static var baseURL: String {
        guard let path = Bundle.main.path(forResource: "ConfigInfo", ofType: "xcprivacy"),
                let configDict = NSDictionary(contentsOfFile: path),
                let baseURL = configDict["BaseURL"] as? String else {
            fatalError("Arquivo de configuração ausente ou chave BaseURL não encontrada.")
        }
        return baseURL
    }
    
    static var apiKey: String {
        guard let path = Bundle.main.path(forResource: "ConfigInfo", ofType: "xcprivacy"),
              let configDict = NSDictionary(contentsOfFile: path),
              let apiKey = configDict["ApiKey"] as? String else {
            fatalError("Arquivo de configuração ausente ou chave API não encontrada.")
        }
        return apiKey
    }
}
