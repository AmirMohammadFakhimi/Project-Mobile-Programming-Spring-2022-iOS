//
//  Cryptocurrency.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/3/1401 AP.
//

import Foundation

struct CryptocurrencyInfo: Codable {
    var date: String
    var open: Double
    var high: Double
    var low: Double
    var close: Double
}

class Cryptocurrency: Codable {
    var symbol: String
    var name: String
    var showingName: String
    var isFavorite: Bool = false
    var virtualTradingAmount: Double = 0
    
    var history: [CryptocurrencyInfo]
    
    init(symbol: String, name: String, history: [CryptocurrencyInfo], showingName: String) {
        self.symbol = symbol
        self.name = name
        self.history = history
        self.showingName = showingName
    }
}
