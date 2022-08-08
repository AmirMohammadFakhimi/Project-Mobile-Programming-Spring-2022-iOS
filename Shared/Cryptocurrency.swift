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
    var name: String
    var abbreviation: String
    var price: Double
    var virtualTradingAmount: Double = 0
    var isFavorite: Bool = false
    var history: [CryptocurrencyInfo]
    
    var completeName: String {
        get {
            name + " (" + abbreviation + ")"
        }
        set {
            let splitNewValue = newValue.components(separatedBy: " ")
            name = splitNewValue[0]
            abbreviation = splitNewValue[1]
        }
    }
    var symbol: String {
        get {
            abbreviation + "/USD"
        }
        set {
            abbreviation = newValue.components(separatedBy: "/")[0]
        }
    }
    
    init(symbol: String, name: String, price: Double = 0, history: [CryptocurrencyInfo], abbreviation: String) {
        self.name = name
        self.abbreviation = abbreviation
        self.price = price
        self.history = history
    }
}
